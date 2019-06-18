IF OBJECT_ID('academy.sp_AlteraPlano') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_AlteraPlano
END
GO

CREATE PROCEDURE academy.sp_AlteraPlano
    @IdPlano TINYINT               = NULL
   ,@NomePlano VARCHAR(25)         = NULL
   ,@PermiteDesconto BIT           = NULL
   ,@NumeroDiasBloqueio SMALLINT   = NULL
   ,@NumeroDiasInativacao SMALLINT = NULL
   ,@NumeroDiasCorrido SMALLINT    = NULL
   ,@ConsideraSabado BIT           = NULL
   ,@ConsideraDomingo BIT          = NULL
   ,@ConsideraFeriados BIT         = NULL
   ,@LogIdUsuario SMALLINT         = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE academy.Planos
            SET NomePlano            = @NomePlano
               ,PermiteDesconto      = @PermiteDesconto
               ,NumeroDiasBloqueio   = @NumeroDiasBloqueio
               ,NumeroDiasInativacao = @NumeroDiasInativacao
               ,NumeroDiasCorrido    = @NumeroDiasCorrido
               ,ConsideraSabado      = @ConsideraSabado
               ,ConsideraDomingo     = @ConsideraDomingo
               ,ConsideraFeriados    = @ConsideraFeriados
               ,LogIdUsuario         = @LogIdUsuario
               ,LogRotina            = 'A'
               ,LogDataHora          = (SELECT getDate())
         WHERE IdPlano = @IdPlano

      COMMIT
   END TRY
   BEGIN CATCH
      SELECT @ErrorMessage  = ERROR_MESSAGE()
            ,@ErrorSeverity = ERROR_SEVERITY()
            ,@ErrorState    = ERROR_STATE()

      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
      ROLLBACK
   END CATCH

   RETURN
END