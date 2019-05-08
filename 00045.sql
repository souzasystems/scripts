IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Turmas')
BEGIN
   CREATE TABLE Academy.Turmas (
      IdTurma SMALLINT IDENTITY(01, 01),
      NomeTurma VARCHAR(50) NULL,
      NumeroVagas SMALLINT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Turmas PRIMARY KEY(IdTurma),
   CONSTRAINT FK_Turmas_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END
