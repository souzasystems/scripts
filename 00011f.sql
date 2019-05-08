IF OBJECT_ID('vw_QuadrasBairros') IS NOT NULL
BEGIN
   DROP VIEW vw_QuadrasBairros
END
GO

CREATE VIEW vw_QuadrasBairros AS (
   SELECT enderecos.Quadras.IdQuadra
         ,enderecos.Quadras.IdBairro
         ,enderecos.Quadras.DescricaoQuadra 
         ,enderecos.Quadras.Complemento
         ,enderecos.Quadras.Inativa
         ,enderecos.Quadras.LogIdUsuario
         ,enderecos.Quadras.LogRotina
         ,enderecos.Quadras.LogDataHora
         ,enderecos.Quadras.LogMotivoExclusao
         ,enderecos.Bairros.NomeBairro
   FROM enderecos.Quadras
   INNER JOIN enderecos.Bairros ON Bairros.IdBairro = Quadras.IdBairro
)