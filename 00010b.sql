IF OBJECT_ID('enderecos.sp_InsereLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_InsereLogradouro
    @DescricaoLogradouro VARCHAR(25)   = NULL
   ,@AbreviaturaLogradouro VARCHAR(10) = NULL
   ,@Inativo BIT                       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdLogradouro SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Logradouros (
       DescricaoLogradouro
      ,AbreviaturaLogradouro
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
      ,LogDataHora
   )
   VALUES (
       @DescricaoLogradouro
      ,@AbreviaturaLogradouro
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
      ,(SELECT getDate())
   )

   SET @IdLogradouro = (SELECT @@IDENTITY)

   RETURN
END