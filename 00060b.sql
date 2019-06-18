IF OBJECT_ID('common.sp_InsereBackUpFirebird') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereBackUpFirebird
END
GO

CREATE PROCEDURE common.sp_InsereBackUpFirebird
    @ServidorProtocolo TINYINT      = NULL
   ,@NomeServidor VARCHAR(250)      = NULL
   ,@Porta INTEGER                  = NULL
   ,@CaminhoBancoDados VARCHAR(250) = NULL
   ,@DestinoBackup VARCHAR(MAX)     = NULL
   ,@Usuario VARCHAR(35)            = NULL
   ,@Senha VARCHAR(MAX)             = NULL
   ,@HorarioBackup TIME             = NULL
   ,@PeriodicidadeBackup TINYINT    = NULL
   ,@ManterBackupsPorXDias TINYINT  = NULL
   ,@Inativo BIT                    = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@IdBackupFirebird TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY

      INSERT INTO common.BackupsFirebird (
          ServidorProtocolo
         ,NomeServidor
         ,Porta
         ,CaminhoBancoDados
         ,DestinoBackup
         ,Usuario
         ,Senha
         ,HorarioBackup
         ,PeriodicidadeBackup
         ,ManterBackupsPorXDias
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
      )
      VALUES (
          @ServidorProtocolo
         ,@NomeServidor
         ,@Porta
         ,@CaminhoBancoDados
         ,@DestinoBackup
         ,@Usuario
         ,@Senha
         ,@HorarioBackup
         ,@PeriodicidadeBackup
         ,@ManterBackupsPorXDias
         ,@Inativo
         ,@LogIdUsuario
         ,'I'
      )

      SET @IdBackUpFirebird = (SELECT @@IDENTITY)
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