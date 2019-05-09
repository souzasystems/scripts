IF OBJECT_ID('enderecos.sp_AlteraBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraBairro
END
GO

CREATE PROCEDURE enderecos.sp_AlteraBairro
    @IdBairro INTEGER       = NULL
   ,@IdCidade SMALLINT      = NULL
   ,@NomeBairro VARCHAR(70) = NULL
   ,@DataVigoracao DATETIME = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Bairros
            SET IdCidade      = @IdCidade
               ,NomeBairro    = @NomeBairro
               ,DataVigoracao = @DataVigoracao
               ,Inativo       = @Inativo
               ,LogIdUsuario  = @LogIdUsuario
               ,LogRotina     = 'A'
               ,LogDataHora   = (SELECT getDate())
         WHERE IdBairro = @IdBairro

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
