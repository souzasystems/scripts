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

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Condominios (
             IdBairro
            ,NomeCondominio
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
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