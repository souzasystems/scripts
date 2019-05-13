IF OBJECT_ID('enderecos.sp_ConsultaVias') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaVias
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaVias
    @NomeVia VARCHAR(60) = NULL
   ,@IdBairro INTEGER    = NULL
   ,@Inativa BIT         = NULL
AS
BEGIN
   SELECT IdVia
         ,IdLogradouro
         ,IdBairro
         ,NomeVia
         ,Cep
         ,Inativa
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,NomeBairro
         ,DescricaoLogradouro
   FROM vw_ViasBairros
   WHERE Inativa  = @Inativa
     AND IdBairro = @IdBairro
     AND NomeVia LIKE @NomeVia

   RETURN
END