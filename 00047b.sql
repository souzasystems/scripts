IF OBJECT_ID('academy.sp_InsereTurmaAtividade') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_InsereTurmaAtividade
END
GO

CREATE PROCEDURE academy.sp_InsereTurmaAtividade
    @IdTurma SMALLINT      = NULL
   ,@IdAtividade SMALLINT  = NULL
   ,@LogIdUsuario SMALLINT = NULL
   ,@IdTurmaAtividade SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO academy.TurmasAtividades (
       IdTurma
      ,IdAtividade
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdTurma
      ,@IdAtividade
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdTurmaAtividade = (SELECT @@IDENTITY)

   RETURN
END