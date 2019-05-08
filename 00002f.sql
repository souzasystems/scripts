IF OBJECT_ID('common.sp_ConsultaTiposTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaTiposTelefone
END
GO

CREATE PROCEDURE common.sp_ConsultaTiposTelefone
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
   ORDER BY IdTipoTelefone

   RETURN
END
GO