IF OBJECT_ID('enderecos.sp_ConsultaEnderecoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaEnderecoFuncionario
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaEnderecoFuncionario
   @IdEnderecoFuncionario INTEGER = NULL
AS
BEGIN
   SELECT IdVia
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
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.EnderecosFuncionarios  WITH(NOLOCK)
   WHERE IdEnderecoFuncionario = @IdEnderecoFuncionario

   RETURN
END
