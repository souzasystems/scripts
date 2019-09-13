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

   SET @IdEnderecoFuncionario = (SELECT @@IDENTITY)

   RETURN
END