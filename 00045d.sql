IF OBJECT_ID('academy.sp_ExcluiTurma') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ExcluiTurma
END
GO

CREATE PROCEDURE academy.sp_ExcluiTurma
    @IdTurma SMALLINT               = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.Turmas
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdTurma = @IdTurma

   DELETE FROM academy.Turmas
   WHERE IdTurma = @IdTurma

   RETURN
END