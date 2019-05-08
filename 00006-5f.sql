IF OBJECT_ID('enderecos.sp_ConsultaTiposZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaTiposZona
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaTiposZona
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   SELECT IdTipoZona
         ,DescricaoTipoZona
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.TiposZona
   ORDER BY IdTipoZona

   RETURN
END
GO