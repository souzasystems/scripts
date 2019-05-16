IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'CentrosCusto')
BEGIN
   CREATE TABLE common.CentrosCusto (
      IdCentroCusto SMALLINT IDENTITY(01, 01),
      NomeCentroCusto VARCHAR(50) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_CentrosCusto PRIMARY KEY (IdCentroCusto),
   CONSTRAINT FK_CentrosCusto_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END