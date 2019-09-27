IF OBJECT_ID('enderecos.sp_InsereVia') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereVia
END
GO

CREATE PROCEDURE enderecos.sp_InsereVia
    @IdLogradouro SMALLINT = NULL
   ,@IdBairro INTEGER      = NULL
   ,@NomeVia VARCHAR(60)   = NULL
   ,@Cep CHAR(08)          = NULL
   ,@Inativa BIT           = NULL
   ,@LogIdUsuario SMALLINT = NULL
   ,@IdVia INTEGER OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Vias (
       IdLogradouro
      ,IdBairro
      ,NomeVia
      ,Cep
      ,Inativa
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdLogradouro
      ,@IdBairro
      ,@NomeVia
      ,@Cep
      ,@Inativa
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdVia = (SELECT @@IDENTITY)

   RETURN
END