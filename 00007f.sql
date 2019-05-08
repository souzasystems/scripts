IF OBJECT_ID('vw_ZonasTiposZona') IS NOT NULL
BEGIN
   DROP VIEW vw_ZonasTiposZona
END
GO

CREATE VIEW vw_ZonasTiposZona AS (
   SELECT enderecos.Zonas.IdZona
         ,enderecos.Zonas.IdTipoZona
         ,enderecos.Zonas.DescricaoZona
         ,enderecos.Zonas.Inativa
         ,enderecos.Zonas.AreaMinima
         ,enderecos.Zonas.TestadaMinima
         ,enderecos.Zonas.ComplementoAreaMinima
         ,enderecos.Zonas.IdentificadorZona
         ,enderecos.Zonas.LogIdUsuario
         ,enderecos.Zonas.LogRotina
         ,enderecos.Zonas.LogDataHora
         ,enderecos.Zonas.LogMotivoExclusao
         ,enderecos.TiposZona.DescricaoTipoZona
   FROM enderecos.Zonas
   INNER JOIN enderecos.TiposZona ON TiposZona.IdTipoZona = Zonas.IdTipoZona
)