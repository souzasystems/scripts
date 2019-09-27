IF OBJECT_ID('enderecos.sp_AlteraTipoZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraTipoZona
END
GO

CREATE PROCEDURE enderecos.sp_AlteraTipoZona
    @IdTipoZona TINYINT            = NULL
   ,@DescricaoTipoZona VARCHAR(25) = NULL
   ,@LogIdUsuario SMALLINT         = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.TiposZona
      SET DescricaoTipoZona = @DescricaoTipoZona
         ,LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'A'
         ,LogDataHora       = (SELECT getDate())
   WHERE IdTipoZona = @IdTipoZona

   RETURN
END
GO