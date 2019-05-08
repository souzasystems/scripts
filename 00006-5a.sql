IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'TiposZona')
BEGIN
   CREATE TABLE enderecos.TiposZona (
      IdTipoZona TINYINT IDENTITY(01, 01),
      DescricaoTipoZona VARCHAR(25) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_TiposZona PRIMARY KEY(IdTipoZona),
   CONSTRAINT FK_TiposZonas_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END