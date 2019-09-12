IF OBJECT_ID('enderecos.sp_InsereEnderecoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereEnderecoFuncionario
END
GO

CREATE PROCEDURE enderecos.sp_InsereEnderecoFuncionario
    @IdFuncionario SMALLINT  = NULL
   ,@IdVia INTEGER           = NULL
   ,@IdTipoEndereco TINYINT  = NULL
   ,@IdLoteamento SMALLINT   = NULL
   ,@IdLote SMALLINT         = NULL
   ,@IdQuadra SMALLINT       = NULL
   ,@IdCondominio SMALLINT   = NULL
   ,@IdDistrito SMALLINT     = NULL
   ,@Numero INTEGER          = NULL
   ,@Complemento VARCHAR(30) = NULL
   ,@LogIdUsuario SMALLINT   = NULL
   ,@IdEnderecoFuncionario INTEGER OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.EnderecosFuncionarios (
             IdFuncionario
            ,IdVia
            ,IdTipoEndereco
            ,IdLoteamento
            ,IdLote
            ,IdQuadra
            ,IdCondominio
            ,IdDistrito
            ,Numero
            ,Complemento
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @IdFuncionario
            ,@IdVia
            ,@IdTipoEndereco
            ,@IdLoteamento
            ,@IdLote
            ,@IdQuadra
            ,@IdCondominio
            ,@IdDistrito
            ,@Numero
            ,@Complemento
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdEnderecoFuncionario = (SELECT @@IDENTITY)
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