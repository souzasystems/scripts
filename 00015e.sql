IF OBJECT_ID('enderecos.sp_ConsultaCondominio') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaCondominio
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaCondominio
   @IdCondominio SMALLINT = NULL
AS
BEGIN
   SELECT IdCondominio
         ,IdBairro
         ,NomeCondominio
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Condominios WITH(NOLOCK)
   WHERE IdCondominio = @IdCondominio

   RETURN
END