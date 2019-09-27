IF OBJECT_ID('enderecos.sp_ConsultaBairro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaBairro
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaBairro
    @IdBairro INTEGER       = NULL
   ,@NomeBairro VARCHAR(70) = NULL
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
   FROM enderecos.Bairros WITH(NOLOCK)
   WHERE IdBairro   = @IdBairro
      OR NomeBairro = @NomeBairro

   RETURN
END
