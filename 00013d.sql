IF OBJECT_ID('enderecos.sp_ExcluiLoteamento') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiLoteamento
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiLoteamento
    @IdLoteamento SMALLINT          = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Loteamentos
      SET LogIdUsuario        = @LogIdUsuario
         ,LogRotina           = 'E'
         ,LogDataHora         = (SELECT getDate())
         ,LogMotivoExclusao   = @LogMotivoExclusao
   WHERE IdLoteamento = @IdLoteamento

   DELETE FROM enderecos.Loteamentos
   WHERE IdLoteamento = @IdLoteamento

   RETURN
END