IF OBJECT_ID('academy.sp_AlteraTurma') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_AlteraTurma
END
GO

CREATE PROCEDURE academy.sp_AlteraTurma
    @IdTurma SMALLINT      = NULL
   ,@NomeTurma VARCHAR(50) = NULL
   ,@NumeroVagas SMALLINT  = NULL
   ,@LogIdUsuario SMALLINT = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.Turmas
      SET NomeTurma    = @NomeTurma
         ,NumeroVagas  = @NumeroVagas
         ,LogIdUsuario = @LogIdUsuario
         ,LogRotina    = 'A'
         ,LogDataHora  = (SELECT getDate())
   WHERE IdTurma = @IdTurma

   RETURN
END