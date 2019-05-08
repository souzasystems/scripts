IF OBJECT_ID('common.sp_AlteraUsuario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraUsuario
END
GO

CREATE PROCEDURE common.sp_AlteraUsuario
    @IdUsuario SMALLINT            = NULL
   ,@NomeUsuario VARCHAR(30)       = NULL
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
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE common.Usuarios
            SET NomeUsuario               = @NomeUsuario
               ,Privilegio                = @Privilegio
               ,Senha                     = @Senha
               ,Inativo                   = @Inativo
               ,DataInicio                = @DataInicio
               ,DataExpiracao             = @DataExpiracao
               ,QuantidadeConexoes        = @QuantidadeConexoes
               ,QuantidadeConectado       = @QuantidadeConectado
               ,AlterarSenhaPrimeiroLogon = @AlterarSenhaPrimeiroLogon
               ,SenhaPorTrintaDias        = @SenhaPorTrintaDias
               ,LogIdUsuario              = @LogIdUsuario
               ,LogRotina                 = 'A'
               ,LogDataHora               = (SELECT getDate())
         WHERE IdUsuario = @IdUsuario

      COMMIT

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