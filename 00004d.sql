IF OBJECT_ID('enderecos.sp_ExcluiPais') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiPais
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiPais
    @IdPais SMALLINT                = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Paises
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdPais = @IdPais

   DELETE FROM enderecos.Paises
   WHERE IdPais = @IdPais

   RETURN
END