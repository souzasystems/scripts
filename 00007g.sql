IF OBJECT_ID('enderecos.sp_ConsultaZonas') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaZonas
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaZonas
AS
BEGIN
   SELECT IdZona
         ,IdTipoZona
         ,DescricaoZona
         ,Inativa
         ,AreaMinima
         ,TestadaMinima
         ,ComplementoAreaMinima
         ,IdentificadorZona
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,DescricaoTipoZona
   FROM vw_ZonasTiposZona
   ORDER BY IdZona

   RETURN
END