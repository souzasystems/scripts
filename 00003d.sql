IF OBJECT_ID('common.sp_ExcluiEstadoCivil') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExcluiEstadoCivil
END
GO

CREATE PROCEDURE common.sp_ExcluiEstadoCivil
    @IdEstadoCivil TINYINT          = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.EstadosCivis
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdEstadoCivil = @IdEstadoCivil

   DELETE FROM common.EstadosCivis
   WHERE IdEstadoCivil = @IdEstadoCivil

   RETURN
END
GO