IF OBJECT_ID('academy.sp_ExcluiAtividadeFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ExcluiAtividadeFuncionario
END
GO

CREATE PROCEDURE academy.sp_ExcluiAtividadeFuncionario
    @IdAtividadeFuncionario INTEGER = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.AtividadesFuncionarios
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdAtividadeFuncionario = @IdAtividadeFuncionario

   DELETE FROM academy.AtividadesFuncionarios
   WHERE IdAtividadeFuncionario = @IdAtividadeFuncionario

   RETURN
END