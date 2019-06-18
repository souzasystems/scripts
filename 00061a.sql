IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'ConfiguracoesBackupRestoreFirebird')
BEGIN
   CREATE TABLE common.ConfiguracoesBackupRestoreFirebird (
      IdConfiguracaoBackupRestoreFirebird TINYINT IDENTITY(01, 01),
      CaminhoGBAK VARCHAR(MAX) NULL,
      IgnorarErrosCHECKSUM BIT NULL,
      IgnorarErrosTransacaoLIMBO BIT NULL,
      BackupTransportavel BIT NULL,
      GerarApenasMETADATA BIT NULL,
      ExecutarGarbageCollection BIT NULL,
      DesativarIndices BIT NULL,
      GravarAposTabela BIT NULL,
      SubstituirBaseExistente BIT NULL,
      Paginacao INTEGER NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_ConfiguracaoBackupRestoreFirebird PRIMARY KEY(IdConfiguracaoBackupRestoreFirebird),
   CONSTRAINT FK_ConfiguracaoBackupRestoreFirebird_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))

   INSERT INTO common.ConfiguracoesBackupRestoreFirebird (
       ExecutarGarbageCollection
      ,SubstituirBaseExistente
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       01
      ,01
      ,01
      ,'I'
   )
END