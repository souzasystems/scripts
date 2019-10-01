IF OBJECT_ID('academy.sp_ConsultaTurmaAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaTurmaAtividade
END
GO

CREATE PROCEDURE academy.sp_ConsultaTurmaAtividade
   @IdTurmaAtividade SMALLINT = NULL
AS
BEGIN
   SELECT IdTurmaAtividade
         ,IdTurma
         ,IdAtividade
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.TurmasAtividades WITH(NOLOCK)
   WHERE IdTurmaAtividade = @IdTurmaAtividade

   RETURN
END