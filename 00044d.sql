IF OBJECT_ID('academy.sp_ExcluiAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ExcluiAtividade
END
GO

CREATE PROCEDURE academy.sp_ExcluiAtividade
    @IdAtividade SMALLINT           = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.Atividades
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdAtividade = @IdAtividade

   DELETE FROM academy.Atividades
   WHERE IdAtividade = @IdAtividade

   RETURN
END