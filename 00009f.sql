IF OBJECT_ID('vw_BairrosCidades') IS NOT NULL
BEGIN
   DROP VIEW vw_BairrosCidades
END
GO

CREATE VIEW vw_BairrosCidades AS (
   SELECT enderecos.Bairros.IdBairro
         ,enderecos.Bairros.IdCidade
         ,enderecos.Bairros.NomeBairro
         ,enderecos.Bairros.DataVigoracao
         ,enderecos.Bairros.Inativo
         ,enderecos.Bairros.LogIdUsuario
         ,enderecos.Bairros.LogRotina
         ,enderecos.Bairros.LogDataHora
         ,enderecos.Bairros.LogMotivoExclusao
         ,enderecos.Cidades.NomeCidade
   FROM enderecos.Bairros WITH(NOLOCK)
   INNER JOIN enderecos.Cidades WITH(NOLOCK) ON Cidades.IdCidade = Bairros.IdCidade
)