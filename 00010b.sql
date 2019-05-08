IF OBJECT_ID('enderecos.sp_InsereLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_InsereLogradouro
    @DescricaoLogradouro VARCHAR(25)   = NULL
   ,@AbreviaturaLogradouro VARCHAR(10) = NULL
   ,@Inativo BIT                       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdLogradouro SMALLINT OUTPUT
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

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@DescricaoLogradouro, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição do logradouro não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Logradouros (
             DescricaoLogradouro
            ,AbreviaturaLogradouro
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
            ,LogDataHora
         )
         VALUES(
             @DescricaoLogradouro
            ,@AbreviaturaLogradouro
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
            ,(SELECT getDate())
         )

      COMMIT

      SET @IdLogradouro = (SELECT @@IDENTITY)
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