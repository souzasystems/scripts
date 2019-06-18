IF OBJECT_ID('common.sp_AlteraConfiguracaoBackupRestoreFirebird') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraConfiguracaoBackupRestoreFirebird
END
GO

CREATE PROCEDURE common.sp_AlteraConfiguracaoBackupRestoreFirebird
    @IdConfiguracaoBackupRestoreFirebird TINYINT
   ,@CaminhoGBAK VARCHAR(MAX)
   ,@IgnorarErrosCHECKSUM BIT
   ,@IgnorarErrosTransacaoLIMBO BIT
   ,@BackupTransportavel BIT
   ,@GerarApenasMETADATA BIT
   ,@ExecutarGarbageCollection BIT
   ,@DesativarIndices BIT
   ,@GravarAposTabela BIT
   ,@SubstituirBaseExistente BIT
   ,@Paginacao INTEGER
   ,@LogIdUsuario SMALLINT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY

      UPDATE common.ConfiguracoesBackupRestoreFirebird
         SET CaminhoGBAK                = @CaminhoGBAK
            ,IgnorarErrosCHECKSUM       = @IgnorarErrosCHECKSUM
            ,IgnorarErrosTransacaoLIMBO = @IgnorarErrosTransacaoLIMBO
            ,BackupTransportavel        = @BackupTransportavel
            ,GerarApenasMETADATA        = @GerarApenasMETADATA
            ,ExecutarGarbageCollection  = @ExecutarGarbageCollection
            ,DesativarIndices           = @DesativarIndices
            ,GravarAposTabela           = @GravarAposTabela
            ,SubstituirBaseExistente    = @SubstituirBaseExistente
            ,Paginacao                  = @Paginacao
            ,LogIdUsuario               = @LogIdUsuario
            ,LogRotina                  = 'A'
            ,LogDataHora                = (SELECT getDate())
      WHERE IdConfiguracaoBackupRestoreFirebird = @IdConfiguracaoBackupRestoreFirebird

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