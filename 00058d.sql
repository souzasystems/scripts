IF OBJECT_ID('common.sp_ExcluiTelefoneFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiTelefoneFuncionario
END
GO

CREATE PROCEDURE common.sp_ExcluiTelefoneFuncionario
    @IdTelefoneFuncionario SMALLINT = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.TelefonesFuncionarios
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdTelefoneFuncionario = @IdTelefoneFuncionario

   DELETE FROM common.TelefonesFuncionarios
   WHERE IdTelefoneFuncionario = @IdTelefoneFuncionario

   RETURN
END
GO