IF OBJECT_ID('enderecos.sp_ExcluiVia') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiVia
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiVia
    @IdVia INTEGER                  = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Vias 
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdVia = @IdVia

   DELETE FROM enderecos.Vias
   WHERE IdVia = @IdVia

   RETURN
END