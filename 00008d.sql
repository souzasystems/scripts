IF OBJECT_ID('enderecos.sp_ExcluiDistrito') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiDistrito
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiDistrito
    @IdDistrito SMALLINT            = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Distritos
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdDistrito = @IdDistrito

   DELETE FROM enderecos.Distritos
   WHERE IdDistrito = @IdDistrito

   RETURN
END