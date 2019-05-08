IF OBJECT_ID('vw_EstadosPaises') IS NOT NULL
BEGIN
   DROP VIEW vw_EstadosPaises
END
GO

CREATE VIEW vw_EstadosPaises AS (
   SELECT enderecos.Estados.IdEstado
         ,enderecos.Estados.IdPais
         ,enderecos.Estados.NomeEstado
         ,enderecos.Estados.SiglaEstado
         ,enderecos.Estados.CodigoIBGE
         ,enderecos.Estados.Inativo
         ,enderecos.Estados.LogIdUsuario
         ,enderecos.Estados.LogRotina
         ,enderecos.Estados.LogDataHora
         ,enderecos.Estados.LogMotivoExclusao
         ,enderecos.Paises.NomePais
   FROM enderecos.Estados
   INNER JOIN enderecos.Paises ON Paises.IdPais = Estados.IdPais
)