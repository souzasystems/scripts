IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Zonas')
BEGIN
   CREATE TABLE enderecos.Zonas (
      IdZona SMALLINT IDENTITY(01, 01),
      IdTipoZona TINYINT NULL,
      DescricaoZona VARCHAR(50) NULL,
      Inativa BIT DEFAULT 00,
      AreaMinima DECIMAL(15, 03) NULL,
      TestadaMinima DECIMAL(15, 03) NULL,
      ComplementoAreaMinima VARCHAR(8) NULL,
      IdentificadorZona VARCHAR(10) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Zonas PRIMARY KEY(IdZona),
   CONSTRAINT FK_Zonas_TiposZonas FOREIGN KEY(IdTipoZona) REFERENCES enderecos.TiposZona(IdTipoZona),
   CONSTRAINT FK_Zonas_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END