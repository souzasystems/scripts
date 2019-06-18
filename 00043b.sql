IF OBJECT_ID('academy.sp_InserePlano') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_InserePlano
END
GO

CREATE PROCEDURE academy.sp_InserePlano
    @NomePlano VARCHAR(25)         = NULL
   ,@PermiteDesconto BIT           = NULL
   ,@NumeroDiasBloqueio SMALLINT   = NULL
   ,@NumeroDiasInativacao SMALLINT = NULL
   ,@NumeroDiasCorrido SMALLINT    = NULL
   ,@ConsideraSabado BIT           = NULL
   ,@ConsideraDomingo BIT          = NULL
   ,@ConsideraFeriados BIT         = NULL
   ,@LogIdUsuario SMALLINT         = NULL
   ,@IdPlano TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO academy.Planos (
             NomePlano
            ,PermiteDesconto
            ,NumeroDiasBloqueio
            ,NumeroDiasInativacao
            ,NumeroDiasCorrido
            ,ConsideraSabado
            ,ConsideraDomingo
            ,ConsideraFeriados
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @NomePlano
            ,@PermiteDesconto
            ,@NumeroDiasBloqueio
            ,@NumeroDiasInativacao
            ,@NumeroDiasCorrido
            ,@ConsideraSabado
            ,@ConsideraDomingo
            ,@ConsideraFeriados
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdPlano = (SELECT @@IDENTITY)
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