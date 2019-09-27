IF OBJECT_ID('enderecos.sp_ExcluiLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiLogradouro
    @IdLogradouro SMALLINT          = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Logradouros
      SET LogIdUsuario      = @LogIdUsuario
         ,LogRotina         = 'E'
         ,LogDataHora       = (SELECT getDate())
         ,LogMotivoExclusao = @LogMotivoExclusao
   WHERE IdLogradouro = @IdLogradouro

   DELETE FROM enderecos.Logradouros
   WHERE IdLogradouro = @IdLogradouro

   RETURN
END