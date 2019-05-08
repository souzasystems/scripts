IF OBJECT_ID('common.sp_ConsultaTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaTipoTelefone
END
GO

CREATE PROCEDURE common.sp_ConsultaTipoTelefone
   @IdTipoTelefone TINYINT = NULL
AS
BEGIN
   SELECT IdTipoTelefone
         ,DescricaoTipoTelefone
         ,MascaraTelefone
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.TiposTelefone
   WHERE IdTipoTelefone = @IdTipoTelefone

   RETURN
END
GO