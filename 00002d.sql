IF OBJECT_ID('common.sp_ExcluiTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiTipoTelefone
END
GO

CREATE PROCEDURE common.sp_ExcluiTipoTelefone
    @IdTipoTelefone TINYINT         = NULL
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

         UPDATE common.TiposTelefone
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdTipoTelefone = @IdTipoTelefone

         DELETE FROM common.TiposTelefone
         WHERE IdTipoTelefone = @IdTipoTelefone

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
GO