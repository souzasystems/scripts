IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'BackupsFirebird')
BEGIN
   CREATE TABLE common.BackupsFirebird (
      IdBackupFirebird TINYINT IDENTITY(01, 01),
      ServidorProtocolo TINYINT NULL,
      NomeServidor VARCHAR(250) NULL,
      Porta INTEGER NULL,
      CaminhoBancoDados VARCHAR(250) NULL,
      DestinoBackup VARCHAR(MAX) NULL,
      Usuario VARCHAR(35) NULL,
      Senha VARCHAR(MAX) NULL,
      HorarioBackup TIME NULL,
      PeriodicidadeBackup TINYINT NULL,
      ManterBackupsPorXDias TINYINT NULL,
      Inativo BIT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_BackupsFirebird PRIMARY KEY (IdBackupFirebird),
   CONSTRAINT FK_BackupsFirebird_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END