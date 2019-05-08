IF OBJECT_ID('vw_LoteamentosQuadras') IS NOT NULL
BEGIN
   DROP VIEW vw_LoteamentosQuadras
END
GO

CREATE VIEW vw_LoteamentosQuadras AS (
   SELECT enderecos.Loteamentos.IdLoteamento
         ,enderecos.Loteamentos.IdQuadra
         ,enderecos.Loteamentos.DescricaoLoteamento
         ,enderecos.Loteamentos.Inativo
         ,enderecos.Loteamentos.LogIdUsuario
         ,enderecos.Loteamentos.LogRotina
         ,enderecos.Loteamentos.LogDataHora
         ,enderecos.Loteamentos.LogMotivoExclusao
         ,enderecos.Quadras.DescricaoQuadra
   FROM enderecos.Loteamentos
   INNER JOIN enderecos.Quadras ON Quadras.IdQuadra = Loteamentos.IdQuadra
)