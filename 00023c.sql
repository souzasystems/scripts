IF OBJECT_ID('common.sp_AlteraFuncaoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraFuncaoFuncionario
END
GO

CREATE PROCEDURE common.sp_AlteraFuncaoFuncionario
    @IdFuncaoFuncionario TINYINT            = NULL
   ,@DescricaoFuncaoFuncionario VARCHAR(60) = NULL
   ,@LogIdUsuario SMALLINT                  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE common.FuncoesFuncionario
            SET DescricaoFuncaoFuncionario = @DescricaoFuncaoFuncionario
               ,LogIdUsuario               = @LogIdUsuario
               ,LogRotina                  = 'A'
               ,LogDataHora                = (SELECT getDate())
         WHERE IdFuncaoFuncionario = @IdFuncaoFuncionario

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