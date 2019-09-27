IF OBJECT_ID('enderecos.sp_InsereCondominio') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereCondominio
END
GO

CREATE PROCEDURE enderecos.sp_InsereCondominio
    @IdBairro INTEGER           = NULL
   ,@NomeCondominio VARCHAR(50) = NULL
   ,@Inativo BIT                = NULL
   ,@LogIdUsuario SMALLINT      = NULL
   ,@IdCondominio SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Condominios (
       IdBairro
      ,NomeCondominio
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdBairro
      ,@NomeCondominio
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdCondominio = (SELECT @@IDENTITY)

   RETURN
END