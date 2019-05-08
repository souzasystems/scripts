IF OBJECT_ID('enderecos.sp_AlteraLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_AlteraLogradouro
    @IdLogradouro SMALLINT             = NULL
   ,@DescricaoLogradouro VARCHAR(25)   = NULL
   ,@AbreviaturaLogradouro VARCHAR(10) = NULL
   ,@Inativo BIT                       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@AbreviaturaLogradouro, '') = ''
   BEGIN
      SET @ErrorMessage = 'A abreviatura do logradouro não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 11, 01)
      RETURN
   END

   IF ISNULL(@DescricaoLogradouro, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição do logradouro não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 11, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Logradouros
            SET DescricaoLogradouro   = @DescricaoLogradouro
               ,AbreviaturaLogradouro = @AbreviaturaLogradouro
               ,Inativo               = @Inativo
               ,LogIdUsuario          = @LogIdUsuario
               ,LogRotina             = 'A'
               ,LogDataHora           = (SELECT getDate())
         WHERE IdLogradouro = @IdLogradouro

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