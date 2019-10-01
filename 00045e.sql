IF OBJECT_ID('academy.sp_ConsultaTurma') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaTurma
END
GO

CREATE PROCEDURE academy.sp_ConsultaTurma
   @IdTurma SMALLINT = NULL
AS
BEGIN
   SELECT IdTurma
         ,NomeTurma
         ,NumeroVagas
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.Turmas WITH(NOLOCK)
   WHERE IdTurma = @IdTurma

   RETURN
END