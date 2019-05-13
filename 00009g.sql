IF OBJECT_ID('enderecos.sp_ConsultaBairros') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaBairros
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaBairros
    @NomeBairro VARCHAR(70) = NULL
   ,@Inativo BIT            = NULL
AS
BEGIN
   SELECT IdBairro
         ,IdCidade
         ,NomeBairro
         ,DataVigoracao
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,NomeCidade
   FROM vw_BairrosCidades
   WHERE Inativo = @Inativo
     AND NomeBairro LIKE @NomeBairro

   RETURN
END