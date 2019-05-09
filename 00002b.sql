IF OBJECT_ID('common.sp_InsereTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereTipoTelefone
END
GO

CREATE PROCEDURE common.sp_InsereTipoTelefone
    @DescricaoTipoTelefone VARCHAR(25) = NULL
   ,@MascaraTelefone VARCHAR(15)       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdTipoTelefone TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO common.TiposTelefone (
             DescricaoTipoTelefone
            ,MascaraTelefone
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @DescricaoTipoTelefone
            ,@MascaraTelefone
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdTipoTelefone = (SELECT @@IDENTITY)
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