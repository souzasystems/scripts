IF OBJECT_ID('vw_ViasBairros') IS NOT NULL
BEGIN
   DROP VIEW vw_ViasBairros
END
GO

CREATE VIEW vw_ViasBairros AS (
   SELECT enderecos.Vias.IdVia
         ,enderecos.Vias.IdLogradouro
         ,enderecos.Vias.IdBairro
         ,enderecos.Vias.NomeVia
         ,enderecos.Vias.Cep
         ,enderecos.Vias.Inativa
         ,enderecos.Vias.LogIdUsuario
         ,enderecos.Vias.LogRotina
         ,enderecos.Vias.LogDataHora
         ,enderecos.Vias.LogMotivoExclusao
         ,enderecos.Bairros.NomeBairro
         ,enderecos.Logradouros.DescricaoLogradouro
   FROM enderecos.Vias WITH(NOLOCK)
   INNER JOIN enderecos.Bairros     WITH(NOLOCK) ON Bairros.IdBairro         = Vias.IdBairro
   INNER JOIN enderecos.Logradouros WITH(NOLOCK) ON Logradouros.IdLogradouro = Vias.IdLogradouro
)