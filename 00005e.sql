IF OBJECT_ID('enderecos.sp_ConsultaEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaEstado
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaEstado
    @IdEstado SMALLINT      = NULL
   ,@NomeEstado VARCHAR(20) = NULL
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
   FROM enderecos.Estados WITH(NOLOCK)
   WHERE IdEstado   = @IdEstado
      OR NomeEstado = @NomeEstado

   RETURN
END