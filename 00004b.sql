IF OBJECT_ID('enderecos.sp_InserePais') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InserePais
END
GO

CREATE PROCEDURE enderecos.sp_InserePais
    @NomePais VARCHAR(50)   = NULL
   ,@Sigla02 CHAR(02)       = NULL
   ,@Sigla03 CHAR(03)       = NULL
   ,@CodigoIso3166 SMALLINT = NULL
   ,@NumeroDDI SMALLINT     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdPais SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Paises (
       NomePais
      ,Sigla02
      ,Sigla03
      ,CodigoIso3166
      ,NumeroDDI
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @NomePais
      ,@Sigla02
      ,@Sigla03
      ,@CodigoIso3166
      ,@NumeroDDI
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdPais = (SELECT @@IDENTITY)

   RETURN
END