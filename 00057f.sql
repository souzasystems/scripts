IF OBJECT_ID('enderecos.sp_ConsultaEnderecosFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaEnderecosFuncionario
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaEnderecosFuncionario
   @IdFuncionario SMALLINT = NULL
AS
BEGIN
   SELECT IdEnderecoFuncionario
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
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.EnderecosFuncionarios WITH(NOLOCK)
   WHERE IdFuncionario = @IdFuncionario

   RETURN
END
