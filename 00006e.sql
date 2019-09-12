IF OBJECT_ID('enderecos.sp_ConsultaCidade') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaCidade
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaCidade
    @IdCidade SMALLINT      = NULL
   ,@NomeCidade VARCHAR(45) = NULL
AS
BEGIN
   SELECT IdCidade
         ,IdEstado
         ,NomeCidade
         ,CodigoIBGE
         ,NumeroDDD
         ,Inativa
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Cidades
   WHERE IdCidade   = @IdCidade
      OR NomeCidade = @NomeCidade

   RETURN
END