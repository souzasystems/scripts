IF OBJECT_ID('common.sp_AlteraBackUpFirebird') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraBackUpFirebird
END
GO

CREATE PROCEDURE common.sp_AlteraBackUpFirebird
    @IdBackupFirebird TINYINT       = NULL
   ,@ServidorProtocolo TINYINT      = NULL
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
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY

      UPDATE common.BackupsFirebird
         SET ServidorProtocolo     = @ServidorProtocolo
            ,NomeServidor          = @NomeServidor
            ,Porta                 = @Porta
            ,CaminhoBancoDados     = @CaminhoBancoDados
            ,DestinoBackup         = @DestinoBackup
            ,Usuario               = @Usuario
            ,Senha                 = @Senha
            ,HorarioBackup         = @HorarioBackup
            ,PeriodicidadeBackup   = @PeriodicidadeBackup
            ,ManterBackupsPorXDias = @ManterBackupsPorXDias
            ,Inativo               = @Inativo
            ,LogIdUsuario          = @LogIdUsuario
            ,LogRotina             = 'A'
            ,LogDataHora           = (SELECT getDate())
      WHERE IdBackUpFirebird = @IdBackUpFirebird

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