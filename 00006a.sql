IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Cidades')
BEGIN
   CREATE TABLE enderecos.Cidades (
      IdCidade SMALLINT IDENTITY(01, 01) NOT NULL,
      IdEstado SMALLINT NOT NULL,
      NomeCidade VARCHAR(45) NULL,
      CodigoIBGE INTEGER NULL,
      NumeroDDD TINYINT NULL,
      Inativa BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Cidades PRIMARY KEY(IdCidade),
   CONSTRAINT FK_Cidades_Estados FOREIGN KEY(IdEstado) REFERENCES enderecos.Estados(IdEstado),
   CONSTRAINT FK_Cidades_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
GO