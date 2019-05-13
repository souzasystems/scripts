IF OBJECT_ID('enderecos.sp_ConsultaCondominios') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaCondominios
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaCondominios
    @NomeCondominio VARCHAR(50) = NULL
   ,@Inativo SMALLINT           = NULL
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
         ,NomeBairro
   FROM vw_CondominiosBairros
   WHERE Inativo = @Inativo
     AND NomeCondominio LIKE @NomeCondominio

   RETURN
END