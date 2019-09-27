IF OBJECT_ID('common.sp_ExcluiTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiTipoTelefone
END
GO

CREATE PROCEDURE common.sp_ExcluiTipoTelefone
    @IdTipoTelefone TINYINT         = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.TiposTelefone
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdTipoTelefone = @IdTipoTelefone

   DELETE FROM common.TiposTelefone
   WHERE IdTipoTelefone = @IdTipoTelefone

   RETURN
END
GO