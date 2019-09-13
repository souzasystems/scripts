IF OBJECT_ID('common.sp_ExcluiFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiFuncionario
END
GO

CREATE PROCEDURE common.sp_ExcluiFuncionario
    @IdFuncionario SMALLINT         = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.Funcionarios
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdFuncionario = @IdFuncionario

   DELETE FROM common.Funcionarios
   WHERE IdFuncionario = @IdFuncionario

   RETURN
END
GO