IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Paises')
BEGIN
   CREATE TABLE enderecos.Paises (
      IdPais SMALLINT IDENTITY(01, 01) NOT NULL,
      NomePais VARCHAR(50) NULL,
      Sigla02 CHAR(02) NULL,
      Sigla03 CHAR(03) NULL,
      CodigoIso3166 SMALLINT NULL,
      NumeroDDI SMALLINT NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Paises PRIMARY KEY(IdPais),
   CONSTRAINT FK_Paises_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
GO