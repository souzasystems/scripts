IF OBJECT_ID('enderecos.sp_ConsultaDistrito') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaDistrito
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaDistrito
   @IdDistrito SMALLINT = NULL
AS
BEGIN
   SELECT IdDistrito
         ,IdCidade
         ,NomeDistrito
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Distritos WITH(NOLOCK)
   WHERE IdDistrito = @IdDistrito

   RETURN
END