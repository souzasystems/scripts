IF OBJECT_ID('enderecos.sp_AlteraEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraEstado
END
GO

CREATE PROCEDURE enderecos.sp_AlteraEstado
    @IdEstado SMALLINT      = NULL
   ,@IdPais SMALLINT        = NULL
   ,@NomeEstado VARCHAR(20) = NULL
   ,@SiglaEstado CHAR(02)   = NULL
   ,@CodigoIBGE TINYINT     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Estados
      SET IdPais       = @IdPais
         ,NomeEstado   = @NomeEstado
         ,SiglaEstado  = @SiglaEstado
         ,CodigoIBGE   = @CodigoIBGE
         ,Inativo      = @Inativo
         ,LogIdUsuario = @LogIdUsuario
         ,LogRotina    = 'A'
         ,LogDataHora  = (SELECT getDate())
   WHERE IdEstado = @IdEstado

   RETURN
END