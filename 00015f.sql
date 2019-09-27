IF OBJECT_ID('vw_CondominiosBairros') IS NOT NULL
BEGIN
   DROP VIEW vw_CondominiosBairros
END
GO

CREATE VIEW vw_CondominiosBairros AS (
   SELECT enderecos.Condominios.IdCondominio
         ,enderecos.Condominios.IdBairro
         ,enderecos.Condominios.NomeCondominio
         ,enderecos.Condominios.Inativo
         ,enderecos.Condominios.LogIdUsuario
         ,enderecos.Condominios.LogRotina
         ,enderecos.Condominios.LogDataHora
         ,enderecos.Condominios.LogMotivoExclusao
         ,enderecos.Bairros.NomeBairro
   FROM enderecos.Condominios WITH(NOLOCK)
   INNER JOIN enderecos.Bairros ON Bairros.IdBairro = Condominios.IdBairro
)