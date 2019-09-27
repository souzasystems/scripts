IF OBJECT_ID('enderecos.sp_ExcluiCidade') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiCidade
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiCidade
    @IdCidade SMALLINT              = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Cidades
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdCidade = @IdCidade

   DELETE FROM enderecos.Cidades
   WHERE IdCidade = @IdCidade

   RETURN
END