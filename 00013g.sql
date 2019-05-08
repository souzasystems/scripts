IF OBJECT_ID('enderecos.sp_ConsultaLoteamentos') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaLoteamentos
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaLoteamentos
    @Inativo SMALLINT                = NULL
   ,@DescricaoLoteamento VARCHAR(50) = NULL
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
         ,DescricaoQuadra
   FROM vw_LoteamentosQuadras
   WHERE Inativo = @Inativo
     AND DescricaoLoteamento LIKE @DescricaoLoteamento

   RETURN
END