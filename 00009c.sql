IF OBJECT_ID('enderecos.sp_AlteraBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraBairro
END
GO

CREATE PROCEDURE enderecos.sp_AlteraBairro
    @IdBairro INTEGER       = NULL
   ,@IdCidade SMALLINT      = NULL
   ,@NomeBairro VARCHAR(70) = NULL
   ,@DataVigoracao DATETIME = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Bairros
      SET IdCidade      = @IdCidade
         ,NomeBairro    = @NomeBairro
         ,DataVigoracao = @DataVigoracao
         ,Inativo       = @Inativo
         ,LogIdUsuario  = @LogIdUsuario
         ,LogRotina     = 'A'
         ,LogDataHora   = (SELECT getDate())
   WHERE IdBairro = @IdBairro

   RETURN
END
