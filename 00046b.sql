IF OBJECT_ID('academy.sp_InsereAtividadeFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_InsereAtividadeFuncionario
END
GO

CREATE PROCEDURE academy.sp_InsereAtividadeFuncionario
    @IdAtividade SMALLINT   = NULL
   ,@IdFuncionario SMALLINT = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdAtividadeFuncionario INTEGER OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO academy.AtividadesFuncionarios (
       IdAtividade
      ,IdFuncionario
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdAtividade
      ,@IdFuncionario
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdAtividadeFuncionario = (SELECT @@IDENTITY)

   RETURN
END