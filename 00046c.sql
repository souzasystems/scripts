IF OBJECT_ID('academy.sp_AlteraAtividadeFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_AlteraAtividadeFuncionario
END
GO

CREATE PROCEDURE academy.sp_AlteraAtividadeFuncionario
    @IdAtividadeFuncionario INTEGER = NULL
   ,@IdAtividade SMALLINT           = NULL
   ,@IdFuncionario SMALLINT         = NULL
   ,@LogIdUsuario SMALLINT          = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE academy.AtividadesFuncionarios
      SET IdAtividade   = @IdAtividade
         ,IdFuncionario = @IdFuncionario
         ,LogIdUsuario  = @LogIdUsuario
         ,LogRotina     = 'A'
         ,LogDataHora   = (SELECT getDate())
   WHERE IdAtividadeFuncionario = @IdAtividadeFuncionario

   RETURN
END