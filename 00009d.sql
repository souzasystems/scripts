IF OBJECT_ID('enderecos.sp_ExcluiBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiBairro
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiBairro
    @IdBairro INTEGER               = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Bairros
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdBairro = @IdBairro

   DELETE FROM enderecos.Bairros
   WHERE IdBairro = @IdBairro

   RETURN
END
