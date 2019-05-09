IF OBJECT_ID('enderecos.sp_InsereTipoZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereTipoZona
END
GO

CREATE PROCEDURE enderecos.sp_InsereTipoZona
    @DescricaoTipoZona VARCHAR(25) = NULL
   ,@LogIdUsuario SMALLINT         = NULL
   ,@IdTipoZona TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.TiposZona (
             DescricaoTipoZona
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @DescricaoTipoZona
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdTipoZona = (SELECT @@IDENTITY)
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