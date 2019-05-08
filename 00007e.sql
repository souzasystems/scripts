IF OBJECT_ID('enderecos.sp_ConsultaZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaZona
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaZona
   @IdZona SMALLINT = NULL
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
   FROM enderecos.Zonas
   WHERE IdZona = @IdZona

   RETURN
END