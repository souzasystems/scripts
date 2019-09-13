IF OBJECT_ID('common.sp_AlteraTelefoneFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraTelefoneFuncionario
END
GO

CREATE PROCEDURE common.sp_AlteraTelefoneFuncionario
    @IdTelefoneFuncionario SMALLINT = NULL
   ,@IdFuncionario SMALLINT         = NULL
   ,@IdTipoTelefone TINYINT         = NULL
   ,@DDDTelefone TINYINT            = NULL
   ,@DDITelefone SMALLINT           = NULL
   ,@NumeroTelefone VARCHAR(09)     = NULL
   ,@LogIdUsuario SMALLINT          = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.TelefonesFuncionarios
      SET IdFuncionario  = @IdFuncionario
         ,IdTipoTelefone = @IdTipoTelefone
         ,DDDTelefone    = @DDDTelefone
         ,DDITelefone    = @DDITelefone
         ,NumeroTelefone = @NumeroTelefone
         ,LogIdUsuario   = @LogIdUsuario
         ,LogRotina      = 'A'
         ,LogDataHora    = (SELECT getDate())
   WHERE IdTelefoneFuncionario = @IdTelefoneFuncionario

   RETURN
END
GO