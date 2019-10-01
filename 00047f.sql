IF OBJECT_ID('vw_TurmasAtividades') IS NOT NULL
BEGIN
   DROP VIEW vw_TurmasAtividades
END
GO

CREATE VIEW vw_TurmasAtividades AS (
   SELECT academy.TurmasAtividades.IdTurmaAtividade
         ,academy.TurmasAtividades.IdTurma
         ,academy.Turmas.NomeTurma
         ,academy.TurmasAtividades.IdAtividade
         ,academy.Atividades.Descricao AS DescricaoAtividade
         ,academy.TurmasAtividades.LogIdUsuario
         ,academy.TurmasAtividades.LogRotina
         ,academy.TurmasAtividades.LogDataHora
         ,academy.TurmasAtividades.LogMotivoExclusao
   FROM academy.TurmasAtividades WITH(NOLOCK)
   INNER JOIN academy.Turmas     WITH(NOLOCK) ON Turmas.IdTurma         = TurmasAtividades.IdTurma
   INNER JOIN academy.Atividades WITH(NOLOCK) ON Atividades.IdAtividade = TurmasAtividades.IdAtividade
)