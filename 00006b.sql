IF OBJECT_ID('enderecos.sp_InsereCidade') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereCidade
END
GO

CREATE PROCEDURE enderecos.sp_InsereCidade
    @IdEstado SMALLINT      = NULL
   ,@NomeCidade VARCHAR(45) = NULL
   ,@CodigoIBGE INTEGER     = NULL
   ,@NumeroDDD TINYINT      = NULL
   ,@Inativa BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdCidade SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Cidades (
       IdEstado
      ,NomeCidade
      ,CodigoIBGE
      ,NumeroDDD
      ,Inativa
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdEstado
      ,@NomeCidade
      ,@CodigoIBGE
      ,@NumeroDDD
      ,@Inativa
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdCidade = (SELECT @@IDENTITY)

   RETURN
END