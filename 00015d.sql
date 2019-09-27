IF OBJECT_ID('enderecos.sp_ExcluiCondominio') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiCondominio
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiCondominio
    @IdCondominio SMALLINT          = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Condominios
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdCondominio = @IdCondominio

   DELETE FROM enderecos.Condominios
   WHERE IdCondominio = @IdCondominio

   RETURN
END