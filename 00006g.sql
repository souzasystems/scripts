IF OBJECT_ID('enderecos.sp_ConsultaCidades') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaCidades
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaCidades
    @NomeCidade VARCHAR(45) = NULL
   ,@Inativa BIT            = NULL
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
         ,NomeEstado
   FROM vw_CidadesEstados
   WHERE Inativa = @Inativa
     AND NomeCidade LIKE @NomeCidade

   RETURN
END