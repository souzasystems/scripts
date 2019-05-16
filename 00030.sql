IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Grupos')
BEGIN
   CREATE TABLE common.Grupos (
      IdGrupo SMALLINT IDENTITY(01, 01),
      NomeGrupo VARCHAR(35) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Grupos PRIMARY KEY (IdGrupo),
   CONSTRAINT FK_Grupos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END