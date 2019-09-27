IF OBJECT_ID('enderecos.sp_ExcluiTipoZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiTipoZona
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiTipoZona
    @IdTipoZona TINYINT             = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.TiposZona
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdTipoZona = @IdTipoZona

   DELETE FROM enderecos.TiposZona
   WHERE IdTipoZona = @IdTipoZona

   RETURN
END
GO