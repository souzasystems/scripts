IF OBJECT_ID('enderecos.sp_InsereVia') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereVia
END
GO

CREATE PROCEDURE enderecos.sp_InsereVia
    @IdLogradouro SMALLINT = NULL
   ,@IdBairro INTEGER      = NULL
   ,@NomeVia VARCHAR(60)   = NULL
   ,@Cep CHAR(08)          = NULL
   ,@Inativa BIT           = NULL
   ,@LogIdUsuario SMALLINT = NULL
   ,@IdVia INTEGER OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@Cep, '') = ''
   BEGIN
      SET @ErrorMessage = 'O cep da via não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@IdLogradouro, 00) = 00
   BEGIN
      SET @ErrorMessage = 'O logradouro da via não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@IdBairro, 00) = 00
   BEGIN
      SET @ErrorMessage = 'O bairro a qual a via pertence não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@NomeVia, '') = ''
   BEGIN
      SET @ErrorMessage = 'O nome da via não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Vias (
             IdLogradouro
            ,IdBairro
            ,NomeVia
            ,Cep
            ,Inativa
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES(
             @IdLogradouro
            ,@IdBairro
            ,@NomeVia
            ,@Cep
            ,@Inativa
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdVia = (SELECT @@IDENTITY)
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