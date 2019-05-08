IF OBJECT_ID('enderecos.sp_InsereBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereBairro
END
GO

CREATE PROCEDURE enderecos.sp_InsereBairro
    @IdCidade SMALLINT      = NULL
   ,@NomeBairro VARCHAR(70) = NULL
   ,@DataVigoracao DATE     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdBairro INTEGER OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@NomeBairro, '') = ''
   BEGIN
      SET @ErrorMessage = 'O nome do bairro não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@IdCidade, 00) = 00
   BEGIN
      SET @ErrorMessage = 'A cidade a qual o bairro pertence não foi informada.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Bairros (
             IdCidade
            ,NomeBairro
            ,DataVigoracao
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
            ,LogDataHora
         )
         VALUES(
             @IdCidade
            ,@NomeBairro
            ,@DataVigoracao
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
            ,(SELECT getDate())
         )

      COMMIT

      SET @IdBairro = (SELECT @@IDENTITY)
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
