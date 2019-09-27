IF OBJECT_ID('academy.sp_InsereAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_InsereAtividade
END
GO

CREATE PROCEDURE academy.sp_InsereAtividade
    @NomeAtividade VARCHAR(45) = NULL
   ,@Descricao VARCHAR(MAX)    = NULL
   ,@DataCadastro DATE         = NULL
   ,@Inativa BIT               = NULL
   ,@LogIdUsuario SMALLINT     = NULL
   ,@IdAtividade SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO academy.Atividades (
       NomeAtividade
      ,Descricao
      ,DataCadastro
      ,Inativa
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @NomeAtividade
      ,@Descricao
      ,@DataCadastro
      ,@Inativa
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdAtividade = (SELECT @@IDENTITY)

   RETURN
END