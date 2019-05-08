IF OBJECT_ID('enderecos.sp_InsereCondominio') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereCondominio
END
GO

CREATE PROCEDURE enderecos.sp_InsereCondominio
    @IdBairro INTEGER           = NULL
   ,@NomeCondominio VARCHAR(50) = NULL
   ,@Inativo BIT                = NULL
   ,@LogIdUsuario SMALLINT      = NULL
   ,@IdCondominio SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@IdBairro, 00) = 00
   BEGIN
      SET @ErrorMessage = 'O bairro a qual o condomínio pertence não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@NomeCondominio, '') = ''
   BEGIN
      SET @ErrorMessage = 'O nome do condomínio não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Condominios(
             IdBairro
            ,NomeCondominio
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES(
             @IdBairro
            ,@NomeCondominio
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdCondominio = (SELECT @@IDENTITY)
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