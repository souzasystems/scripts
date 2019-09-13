IF OBJECT_ID('common.sp_InsereTelefoneFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereTelefoneFuncionario
END
GO

CREATE PROCEDURE common.sp_InsereTelefoneFuncionario
    @IdFuncionario SMALLINT     = NULL
   ,@IdTipoTelefone TINYINT     = NULL
   ,@DDDTelefone TINYINT        = NULL
   ,@DDITelefone SMALLINT       = NULL
   ,@NumeroTelefone VARCHAR(09) = NULL
   ,@LogIdUsuario SMALLINT      = NULL
   ,@IdTelefoneFuncionario SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO common.TelefonesFuncionarios (
       IdFuncionario
      ,IdTipoTelefone
      ,DDDTelefone
      ,DDITelefone
      ,NumeroTelefone
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdFuncionario
      ,@IdTipoTelefone
      ,@DDDTelefone
      ,@DDITelefone
      ,@NumeroTelefone
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdTelefoneFuncionario = (SELECT @@IDENTITY)

   RETURN
END
GO