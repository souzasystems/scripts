IF OBJECT_ID('enderecos.sp_AlteraCidade') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraCidade
END
GO

CREATE PROCEDURE enderecos.sp_AlteraCidade
    @IdCidade SMALLINT      = NULL
   ,@IdEstado SMALLINT      = NULL
   ,@NomeCidade VARCHAR(45) = NULL
   ,@CodigoIBGE INTEGER     = NULL
   ,@NumeroDDD TINYINT      = NULL
   ,@Inativa BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Cidades
      SET IdEstado     = @IdEstado
         ,NomeCidade   = @NomeCidade
         ,CodigoIBGE   = @CodigoIBGE
         ,NumeroDDD    = @NumeroDDD
         ,Inativa      = @Inativa
         ,LogIdUsuario = @LogIdUsuario
         ,LogRotina    = 'A'
         ,LogDataHora  = (SELECT getDate())
   WHERE IdCidade = @IdCidade

   RETURN
END