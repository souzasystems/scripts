IF OBJECT_ID('enderecos.sp_AlteraZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraZona
END
GO

CREATE PROCEDURE enderecos.sp_AlteraZona
    @IdZona SMALLINT                   = NULL
   ,@IdTipoZona TINYINT                = NULL
   ,@DescricaoZona VARCHAR(50)         = NULL
   ,@Inativa BIT                       = NULL
   ,@AreaMinima DECIMAL(15, 03)        = NULL
   ,@TestadaMinima DECIMAL(15, 03)     = NULL
   ,@ComplementoAreaMinima VARCHAR(08) = NULL
   ,@IdentificadorZona VARCHAR(10)     = NULL
   ,@LogIdUsuario SMALLINT             = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Zonas
      SET IdTipoZona            = @IdTipoZona
         ,DescricaoZona         = @DescricaoZona
         ,Inativa               = @Inativa
         ,AreaMinima            = @AreaMinima
         ,TestadaMinima         = @TestadaMinima
         ,ComplementoAreaMinima = @ComplementoAreaMinima
         ,IdentificadorZona     = @IdentificadorZona
         ,LogIdUsuario          = @LogIdUsuario
         ,LogRotina             = 'A'
         ,LogDataHora           = (SELECT getDate())
   WHERE IdZona = @IdZona

   RETURN
END