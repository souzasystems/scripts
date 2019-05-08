IF OBJECT_ID('enderecos.sp_InsereTipoEndereco') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereTipoEndereco
END
GO

CREATE PROCEDURE enderecos.sp_InsereTipoEndereco
    @DescricaoTipoEndereco VARCHAR(25) = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdTipoEndereco TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.TiposEndereco (
             DescricaoTipoEndereco
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @DescricaoTipoEndereco
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdTipoEndereco = (SELECT @@IDENTITY)
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