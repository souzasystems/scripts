IF OBJECT_ID('academy.sp_InsereTurma') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_InsereTurma
END
GO

CREATE PROCEDURE academy.sp_InsereTurma
    @NomeTurma VARCHAR(50) = NULL
   ,@NumeroVagas SMALLINT  = NULL
   ,@LogIdUsuario SMALLINT = NULL
   ,@IdTurma SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO academy.Turmas (
       NomeTurma
      ,NumeroVagas
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @NomeTurma
      ,@NumeroVagas
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdTurma = (SELECT @@IDENTITY)

   RETURN
END