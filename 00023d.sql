IF OBJECT_ID('common.sp_ExcluiFuncaoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiFuncaoFuncionario
END
GO

CREATE PROCEDURE common.sp_ExcluiFuncaoFuncionario
    @IdFuncaoFuncionario TINYINT    = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
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
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdFuncaoFuncionario = @IdFuncaoFuncionario

         DELETE FROM common.FuncoesFuncionario
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