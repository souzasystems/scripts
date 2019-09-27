IF OBJECT_ID('enderecos.sp_ExcluiQuadra') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiQuadra
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiQuadra
    @IdQuadra SMALLINT              = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Quadras
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdQuadra = @IdQuadra

   DELETE FROM enderecos.Quadras
   WHERE IdQuadra = @IdQuadra

   RETURN
END