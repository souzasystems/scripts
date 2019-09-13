IF OBJECT_ID('vw_TelefonesFuncionario') IS NOT NULL
BEGIN
   DROP VIEW vw_TelefonesFuncionario
END
GO

CREATE VIEW vw_TelefonesFuncionario AS (
   SELECT TelefonesFuncionarios.IdTelefoneFuncionario
         ,TelefonesFuncionarios.IdFuncionario
         ,TelefonesFuncionarios.IdTipoTelefone
         ,TelefonesFuncionarios.DDDTelefone
         ,TelefonesFuncionarios.DDITelefone
         ,TelefonesFuncionarios.NumeroTelefone
         ,TelefonesFuncionarios.LogIdUsuario
         ,TelefonesFuncionarios.LogRotina
         ,TelefonesFuncionarios.LogDataHora
         ,TelefonesFuncionarios.LogMotivoExclusao
         ,TiposTelefone.DescricaoTipoTelefone
   FROM common.TelefonesFuncionarios WITH(NOLOCK)
   INNER JOIN common.TiposTelefone   WITH(NOLOCK)
           ON TiposTelefone.IdTipoTelefone = TelefonesFuncionarios.IdTipoTelefone
)