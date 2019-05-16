IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Setores')
BEGIN
   CREATE TABLE common.Setores (
      IdSetor SMALLINT IDENTITY(01, 01) NOT NULL,
      NomeSetor VARCHAR(50) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Setores PRIMARY KEY (IdSetor),
   CONSTRAINT FK_Setores_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END