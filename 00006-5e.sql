IF OBJECT_ID('enderecos.sp_ConsultaTipoZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaTipoZona
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaTipoZona
   @IdTipoZona TINYINT = NULL
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
   WHERE IdTipoZona = @IdTipoZona

   RETURN
END
GO