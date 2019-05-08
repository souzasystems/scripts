IF OBJECT_ID('enderecos.sp_ConsultaEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaEstado
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaEstado
   @IdEstado SMALLINT = NULL
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
   FROM enderecos.Estados
   WHERE IdEstado = @IdEstado

   RETURN
END