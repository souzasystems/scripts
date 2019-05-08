IF OBJECT_ID('enderecos.sp_AlteraTipoEndereco') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraTipoEndereco
END
GO

CREATE PROCEDURE enderecos.sp_AlteraTipoEndereco
    @IdTipoEndereco TINYINT            = NULL
   ,@DescricaoTipoEndereco VARCHAR(25) = NULL
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

         UPDATE enderecos.TiposEndereco
            SET DescricaoTipoEndereco = @DescricaoTipoEndereco
               ,LogIdUsuario          = @LogIdUsuario
               ,LogRotina             = 'A'
               ,LogDataHora           = (SELECT getDate())
         WHERE IdTipoEndereco = @IdTipoEndereco

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