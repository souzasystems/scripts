IF OBJECT_ID('enderecos.sp_AlteraEnderecoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraEnderecoFuncionario
END
GO

CREATE PROCEDURE enderecos.sp_AlteraEnderecoFuncionario
    @IdEnderecoFuncionario INTEGER = NULL
   ,@IdFuncionario SMALLINT        = NULL
   ,@IdVia INTEGER                 = NULL
   ,@IdTipoEndereco TINYINT        = NULL
   ,@IdLoteamento SMALLINT         = NULL
   ,@IdLote SMALLINT               = NULL
   ,@IdQuadra SMALLINT             = NULL
   ,@IdCondominio SMALLINT         = NULL
   ,@IdDistrito SMALLINT           = NULL
   ,@Numero INTEGER                = NULL
   ,@Complemento VARCHAR(30)       = NULL
   ,@LogIdUsuario SMALLINT         = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.EnderecosFuncionarios
      SET IdFuncionario        = @IdFuncionario
         ,IdVia                = @IdVia
         ,IdTipoEndereco       = @IdTipoEndereco
         ,IdLoteamento         = @IdLoteamento
         ,IdLote               = @IdLote
         ,IdQuadra             = @IdQuadra
         ,IdCondominio         = @IdCondominio
         ,IdDistrito           = @IdDistrito
         ,Numero               = @Numero
         ,Complemento          = @Complemento
         ,LogIdUsuario         = @LogIdUsuario
         ,LogRotina            = 'A'
         ,LogDataHora          = (SELECT getDate())
   WHERE IdEnderecoFuncionario = @IdEnderecoFuncionario

   RETURN
END