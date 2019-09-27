IF OBJECT_ID('vw_DistritosCidades') IS NOT NULL
BEGIN
   DROP VIEW vw_DistritosCidades
END
GO

CREATE VIEW vw_DistritosCidades AS (
   SELECT enderecos.Distritos.IdDistrito
         ,enderecos.Distritos.IdCidade
         ,enderecos.Distritos.NomeDistrito
         ,enderecos.Distritos.Inativo
         ,enderecos.Distritos.LogIdUsuario
         ,enderecos.Distritos.LogRotina
         ,enderecos.Distritos.LogDataHora
         ,enderecos.Distritos.LogMotivoExclusao
         ,enderecos.Cidades.NomeCidade
   FROM enderecos.Distritos WITH(NOLOCK)
   INNER JOIN enderecos.Cidades ON Cidades.IdCidade = Distritos.IdCidade
)