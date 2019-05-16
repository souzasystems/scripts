IF OBJECT_ID('common.sp_ConsultaUsuario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaUsuario
END
GO

CREATE PROCEDURE common.sp_ConsultaUsuario
   @IdUsuario SMALLINT = NULL
AS
BEGIN
   SELECT IdUsuario
         ,NomeUsuario
         ,Privilegio
         ,Senha
         ,Inativo
         ,DataInicio
         ,DataExpiracao
         ,QuantidadeConexoes
         ,QuantidadeConectado
         ,AlterarSenhaPrimeiroLogon
         ,SenhaPorTrintaDias
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.Usuarios WITH(NOLOCK)
   WHERE IdUsuario = @IdUsuario

   RETURN
END
GO