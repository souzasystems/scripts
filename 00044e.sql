IF OBJECT_ID('academy.sp_ConsultaAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaAtividade
END
GO

CREATE PROCEDURE academy.sp_ConsultaAtividade
   @IdAtividade SMALLINT = NULL
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
   WHERE IdAtividade = @IdAtividade

   RETURN
END