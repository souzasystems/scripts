IF OBJECT_ID('enderecos.sp_InsereBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereBairro
END
GO

CREATE PROCEDURE enderecos.sp_InsereBairro
    @IdCidade SMALLINT      = NULL
   ,@NomeBairro VARCHAR(70) = NULL
   ,@DataVigoracao DATE     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdBairro INTEGER OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Bairros (
       IdCidade
      ,NomeBairro
      ,DataVigoracao
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdCidade
      ,@NomeBairro
      ,@DataVigoracao
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdBairro = (SELECT @@IDENTITY)

   RETURN
END
