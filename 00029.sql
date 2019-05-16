IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Unidades')
BEGIN
   CREATE TABLE common.Unidades (
      IdUnidade TINYINT IDENTITY(01, 01),
      SiglaUnidade VARCHAR(05) NULL,
      NomeUnidade VARCHAR(25) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Unidades PRIMARY KEY (IdUnidade),
   CONSTRAINT FK_Unidades_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END