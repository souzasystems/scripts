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

   IF ISNULL(@DescricaoTipoZona, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição do tipo de zona não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 11, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.TiposZona (
             DescricaoTipoZona
            ,LogIdUsuario
            ,LogRotina
            ,LogDataHora
         )
         VALUES(
             @DescricaoTipoZona
            ,@LogIdUsuario
            ,'I'
            ,(SELECT getDate())
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