IF OBJECT_ID('enderecos.sp_InsereQuadra') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereQuadra
END
GO

CREATE PROCEDURE enderecos.sp_InsereQuadra
    @IdBairro INTEGER            = NULL
   ,@DescricaoQuadra VARCHAR(35) = NULL
   ,@Complemento VARCHAR(05)     = NULL
   ,@Inativa BIT                 = NULL
   ,@LogIdUsuario SMALLINT       = NULL
   ,@IdQuadra SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@IdBairro, 00) = 00
   BEGIN
      SET @ErrorMessage = 'O bairro a qual a quadra pertence não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@DescricaoQuadra, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição da quadra não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Quadras(
             IdBairro
            ,DescricaoQuadra
            ,Complemento
            ,Inativa
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES(
             @IdBairro
            ,@DescricaoQuadra
            ,@Complemento
            ,@Inativa
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdQuadra = (SELECT @@IDENTITY)
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