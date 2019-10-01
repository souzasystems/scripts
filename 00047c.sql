IF OBJECT_ID('academy.sp_AlteraTurmaAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_AlteraTurmaAtividade
END
GO

CREATE PROCEDURE academy.sp_AlteraTurmaAtividade
    @IdTurmaAtividade SMALLINT = NULL
   ,@IdTurma SMALLINT          = NULL
   ,@IdAtividade SMALLINT      = NULL
   ,@LogIdUsuario SMALLINT     = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.TurmasAtividades
      SET IdTurma      = @IdTurma
         ,IdAtividade  = @IdAtividade
         ,LogIdUsuario = @LogIdUsuario
         ,LogRotina    = 'A'
         ,LogDataHora  = (SELECT getDate())
   WHERE IdTurmaAtividade = @IdTurmaAtividade

   RETURN
END