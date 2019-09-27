IF OBJECT_ID('enderecos.sp_ExcluiEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiEstado
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiEstado
    @IdEstado SMALLINT              = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Estados
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdEstado = @IdEstado

   DELETE FROM enderecos.Estados
   WHERE IdEstado = @IdEstado

   RETURN
END