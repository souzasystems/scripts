IF OBJECT_ID('academy.sp_ConsultaAtividades') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaAtividades
END
GO

CREATE PROCEDURE academy.sp_ConsultaAtividades
    @NomeAtividade VARCHAR(45) = NULL
   ,@Inativa BIT               = NULL
AS
BEGIN

   SELECT NomeAtividade
         ,Descricao
         ,DataCadastro
         ,Inativa
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.Atividades WITH(NOLOCK)
   WHERE Inativa = @Inativa
     AND NomeAtividade LIKE @NomeAtividade

   RETURN
END
