IF OBJECT_ID('common.sp_ConsultaConfiguracaoBackupRestoreFirebird') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaConfiguracaoBackupRestoreFirebird
END
GO

CREATE PROCEDURE common.sp_ConsultaConfiguracaoBackupRestoreFirebird
   @IdConfiguracaoBackupRestoreFirebird TINYINT = NULL 
AS
BEGIN
   SELECT IdConfiguracaoBackupRestoreFirebird
         ,CaminhoGBAK
         ,IgnorarErrosCHECKSUM
         ,IgnorarErrosTransacaoLIMBO
         ,BackupTransportavel
         ,GerarApenasMETADATA
         ,ExecutarGarbageCollection
         ,DesativarIndices
         ,GravarAposTabela
         ,SubstituirBaseExistente
         ,Paginacao
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.ConfiguracoesBackupRestoreFirebird
   WHERE IdConfiguracaoBackupRestoreFirebird = @IdConfiguracaoBackupRestoreFirebird

   RETURN
END
GO