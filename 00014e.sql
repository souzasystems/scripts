IF OBJECT_ID('enderecos.sp_ConsultaLote') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaLote
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaLote
   @IdLote SMALLINT = NULL
AS
BEGIN
   SELECT IdLote
         ,IdLoteamento
         ,DescricaoLote
         ,Complemento
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Lotes WITH(NOLOCK)
   WHERE IdLote = @IdLote

   RETURN
END