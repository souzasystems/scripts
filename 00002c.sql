IF OBJECT_ID('common.sp_AlteraTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraTipoTelefone
END
GO

CREATE PROCEDURE common.sp_AlteraTipoTelefone
    @IdTipoTelefone TINYINT            = NULL
   ,@DescricaoTipoTelefone VARCHAR(25) = NULL
   ,@MascaraTelefone VARCHAR(15)       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
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
            SET DescricaoTipoTelefone = @DescricaoTipoTelefone
               ,MascaraTelefone       = @MascaraTelefone
               ,LogIdUsuario          = @LogIdUsuario
               ,LogRotina             = 'A'
               ,LogDataHora           = (SELECT getDate())
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