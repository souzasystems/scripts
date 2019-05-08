IF OBJECT_ID('vw_CidadesEstados') IS NOT NULL
BEGIN
   DROP VIEW vw_CidadesEstados
END
GO

CREATE VIEW vw_CidadesEstados AS (
   SELECT enderecos.Cidades.IdCidade
         ,enderecos.Cidades.IdEstado
         ,enderecos.Cidades.NomeCidade
         ,enderecos.Cidades.CodigoIBGE
         ,enderecos.Cidades.NumeroDDD
         ,enderecos.Cidades.Inativa
         ,enderecos.Cidades.LogIdUsuario
         ,enderecos.Cidades.LogRotina
         ,enderecos.Cidades.LogDataHora
         ,enderecos.Cidades.LogMotivoExclusao
         ,enderecos.Estados.NomeEstado
   FROM enderecos.Cidades
   INNER JOIN enderecos.Estados ON Estados.IdEstado = Cidades.IdEstado
)