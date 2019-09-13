IF OBJECT_ID('enderecos.sp_ExcluiEnderecoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiEnderecoFuncionario
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiEnderecoFuncionario
    @IdEnderecoFuncionario INTEGER  = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.EnderecosFuncionarios
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdEnderecoFuncionario = @IdEnderecoFuncionario

   DELETE FROM enderecos.EnderecosFuncionarios
   WHERE IdEnderecoFuncionario = @IdEnderecoFuncionario

   RETURN
END