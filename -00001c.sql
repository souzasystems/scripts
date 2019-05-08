IF OBJECT_ID('common.sp_InsereUsuario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereUsuario
END
GO

CREATE PROCEDURE common.sp_InsereUsuario
    @NomeUsuario VARCHAR(30)       = NULL
   ,@Privilegio CHAR(01)           = NULL
   ,@Senha VARCHAR(128)            = NULL
   ,@Inativo BIT                   = NULL
   ,@DataInicio DATETIME           = NULL
   ,@DataExpiracao DATETIME        = NULL
   ,@QuantidadeConexoes TINYINT    = NULL
   ,@QuantidadeConectado TINYINT   = NULL
   ,@AlterarSenhaPrimeiroLogon BIT = NULL
   ,@SenhaPorTrintaDias BIT        = NULL
   ,@LogIdUsuario SMALLINT         = NULL
   ,@IdUsuario SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO common.Usuarios (
             NomeUsuario
            ,Privilegio
            ,Senha
            ,Inativo
            ,DataInicio
            ,DataExpiracao
            ,QuantidadeConexoes
            ,QuantidadeConectado
            ,AlterarSenhaPrimeiroLogon
            ,SenhaPorTrintaDias
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @NomeUsuario
            ,@Privilegio
            ,@Senha
            ,@Inativo
            ,@DataInicio
            ,@DataExpiracao
            ,@QuantidadeConexoes
            ,@QuantidadeConectado
            ,@AlterarSenhaPrimeiroLogon
            ,@SenhaPorTrintaDias
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdUsuario = (SELECT @@IDENTITY)
   END TRY
   BEGIN CATCH
      SELECT @ErrorMessage  = ERROR_MESSAGE()
            ,@ErrorSeverity = ERROR_SEVERITY()
            ,@ErrorState    = ERROR_STATE()

      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
      ROLLBACK
   END CATCH

   RETURN
END
GO