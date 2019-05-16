IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'SubGrupos')
BEGIN
   CREATE TABLE common.SubGrupos (
      IdSubGrupo SMALLINT IDENTITY(01, 01),
      IdGrupo SMALLINT NULL,   
      NomeSubGrupo VARCHAR(35) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_SubGrupos PRIMARY KEY (IdSubGrupo),
   CONSTRAINT FK_SubGrupos_Grupos FOREIGN KEY(IdGrupo) REFERENCES common.Grupos(IdGrupo),
   CONSTRAINT FK_SubGrupos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END