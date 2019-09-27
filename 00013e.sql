IF OBJECT_ID('enderecos.sp_ConsultaLoteamento') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaLoteamento
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaLoteamento
   @IdLoteamento SMALLINT = NULL
AS
BEGIN
   SELECT IdLoteamento
         ,IdQuadra
         ,DescricaoLoteamento
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Loteamentos WITH(NOLOCK)
   WHERE IdLoteamento = @IdLoteamento

   RETURN
END