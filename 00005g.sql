IF OBJECT_ID('enderecos.sp_ConsultaEstados') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaEstados
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaEstados
    @NomeEstado VARCHAR(20) = NULL
   ,@Inativo BIT            = NULL
AS
BEGIN
   SELECT IdEstado
         ,IdPais
         ,NomeEstado
         ,SiglaEstado
         ,CodigoIBGE
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,NomePais
   FROM vw_EstadosPaises
   WHERE Inativo = @Inativo
     AND NomeEstado LIKE @NomeEstado

   RETURN
END