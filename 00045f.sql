IF OBJECT_ID('academy.sp_ConsultaTurmas') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaTurmas
END
GO

CREATE PROCEDURE academy.sp_ConsultaTurmas
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
   ORDER BY IdTurma

   RETURN
END