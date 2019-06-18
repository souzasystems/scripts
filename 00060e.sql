IF OBJECT_ID('common.sp_ConsultaBackUpFirebird') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaBackUpFirebird
END
GO

CREATE PROCEDURE common.sp_ConsultaBackUpFirebird
   @IdBackupFirebird TINYINT = NULL 
AS
BEGIN
   SELECT IdBackupFirebird
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
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.BackupsFirebird
   WHERE IdBackupFirebird = @IdBackupFirebird

   RETURN
END
GO