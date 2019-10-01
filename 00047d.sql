IF OBJECT_ID('academy.sp_ExcluiTurmaAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ExcluiTurmaAtividade
END
GO

CREATE PROCEDURE academy.sp_ExcluiTurmaAtividade
    @IdTurmaAtividade SMALLINT      = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.TurmasAtividades
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdTurmaAtividade = @IdTurmaAtividade

   DELETE FROM academy.TurmasAtividades
   WHERE IdTurmaAtividade = @IdTurmaAtividade

   RETURN
END