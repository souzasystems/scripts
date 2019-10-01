IF OBJECT_ID('academy.sp_ConsultaTurmaAtividades') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaTurmaAtividades
END
GO

CREATE PROCEDURE academy.sp_ConsultaTurmaAtividades
   @IdTurma SMALLINT = NULL
AS
BEGIN
   SELECT IdTurmaAtividade
         ,IdTurma
         ,NomeTurma
         ,IdAtividade
         ,DescricaoAtividade
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM vw_TurmasAtividades
   WHERE IdTurma = @IdTurma

   RETURN
END