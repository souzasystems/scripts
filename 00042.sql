IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Terminais')
BEGIN
   CREATE TABLE academy.Terminais (
      IdTerminal TINYINT IDENTITY(01, 01),
      DescTerminal VARCHAR(25) NULL,
      Inativo BIT NULL DEFAULT 01,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Terminais PRIMARY KEY(IdTerminal),
   CONSTRAINT FK_Terminais_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
