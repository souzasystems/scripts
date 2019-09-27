IF OBJECT_ID('academy.sp_AlteraAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_AlteraAtividade
END
GO

CREATE PROCEDURE academy.sp_AlteraAtividade
    @IdAtividade SMALLINT       = NULL
   ,@NomeAtividade VARCHAR(45)  = NULL
   ,@Descricao VARCHAR(MAX)     = NULL
   ,@DataCadastro DATE          = NULL
   ,@Inativa BIT                = NULL
   ,@LogIdUsuario SMALLINT      = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.Atividades
      SET NomeAtividade = @NomeAtividade
         ,Descricao     = @Descricao
         ,DataCadastro  = @DataCadastro
         ,Inativa       = @Inativa
         ,LogIdUsuario  = @LogIdUsuario
         ,LogRotina     = 'A'
         ,LogDataHora   = (SELECT getDate())
   WHERE IdAtividade = @IdAtividade

   RETURN
END