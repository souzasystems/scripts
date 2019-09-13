IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'EstadosCivis')
BEGIN
   CREATE TABLE common.EstadosCivis (
      IdEstadoCivil TINYINT IDENTITY(01, 01),
      DescricaoEstadoCivil VARCHAR(25) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME NOT NULL DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID() UNIQUE,
   CONSTRAINT PK_EstadosCivis PRIMARY KEY(IdEstadoCivil),
   CONSTRAINT FK_EstadosCivis_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END