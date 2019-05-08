IF OBJECT_ID('enderecos.sp_AlteraDistrito') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraDistrito
END
GO

CREATE PROCEDURE enderecos.sp_AlteraDistrito
    @IdDistrito SMALLINT      = NULL
   ,@IdCidade SMALLINT        = NULL
   ,@NomeDistrito VARCHAR(50) = NULL
   ,@Inativo BIT              = NULL
   ,@LogIdUsuario SMALLINT    = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@NomeDistrito, '') = ''
   BEGIN
      SET @ErrorMessage = 'O nome do distrito não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@IdCidade, 00) = 00
   BEGIN
      SET @ErrorMessage = 'A cidade a qual o distrito pertence não foi informada.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Distritos
            SET IdCidade     = @IdCidade
               ,NomeDistrito = @NomeDistrito
               ,Inativo      = @Inativo
               ,LogIdUsuario = @LogIdUsuario
               ,LogRotina    = 'A'
               ,LogDataHora  = (SELECT getDate())
         WHERE IdDistrito = @IdDistrito

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