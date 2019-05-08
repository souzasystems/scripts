IF OBJECT_ID('enderecos.sp_ConsultaZonas') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaZonas
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaZonas
    @Inativa BIT               = NULL
   ,@DescricaoZona VARCHAR(50) = NULL
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
   WHERE Inativa = @Inativa
     AND DescricaoZona LIKE @DescricaoZona

   RETURN
END