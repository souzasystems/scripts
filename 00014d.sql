IF OBJECT_ID('enderecos.sp_ExcluiLote') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiLote
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiLote
    @IdLote SMALLINT                = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Lotes
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdLote = @IdLote

   DELETE FROM enderecos.Lotes
   WHERE IdLote = @IdLote

   RETURN
END