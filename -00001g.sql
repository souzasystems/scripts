IF OBJECT_ID('common.sp_ConsultaUsuarios') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaUsuarios
END
GO

CREATE PROCEDURE common.sp_ConsultaUsuarios
    @Inativo BIT             = NULL
   ,@NomeUsuario VARCHAR(30) = NULL
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
   WHERE Inativo = @Inativo
     AND NomeUsuario LIKE @NomeUsuario

   RETURN
END
GO