IF OBJECT_ID('enderecos.sp_ConsultaBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaBairro
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaBairro
   @IdBairro INTEGER = NULL
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
   FROM enderecos.Bairros
   WHERE IdBairro = @IdBairro

   RETURN
END
