IF OBJECT_ID('common.sp_ExcluiBackUpFirebird') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiBackUpFirebird
END
GO

CREATE PROCEDURE common.sp_ExcluiBackUpFirebird
    @IdBackupFirebird TINYINT       = NULL 
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

      UPDATE common.BackupsFirebird
         SET LogIdUsuario      = @LogIdUsuario
            ,LogRotina         = 'E'
            ,LogDataHora       = (SELECT getDate())
            ,LogMotivoExclusao = @LogMotivoExclusao
      WHERE IdBackUpFirebird = @IdBackUpFirebird

      DELETE FROM common.BackupsFirebird
      WHERE IdBackUpFirebird = @IdBackUpFirebird

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
GO