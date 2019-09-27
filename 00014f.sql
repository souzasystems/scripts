IF OBJECT_ID('vw_LotesLoteamentos') IS NOT NULL
BEGIN
   DROP VIEW vw_LotesLoteamentos
END
GO

CREATE VIEW vw_LotesLoteamentos AS (
   SELECT enderecos.Lotes.IdLote
         ,enderecos.Lotes.IdLoteamento
         ,enderecos.Lotes.DescricaoLote
         ,enderecos.Lotes.Complemento
         ,enderecos.Lotes.Inativo
         ,enderecos.Lotes.LogIdUsuario
         ,enderecos.Lotes.LogRotina
         ,enderecos.Lotes.LogDataHora
         ,enderecos.Lotes.LogMotivoExclusao
         ,enderecos.Loteamentos.DescricaoLoteamento
   FROM enderecos.Lotes WITH(NOLOCK)
   INNER JOIN enderecos.Loteamentos WITH(NOLOCK) ON Loteamentos.IdLoteamento = Lotes.IdLoteamento
)