IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Estados')
BEGIN
   CREATE TABLE enderecos.Estados (
      IdEstado SMALLINT IDENTITY(01, 01) NOT NULL,
      IdPais SMALLINT NOT NULL,
      NomeEstado VARCHAR(20) NULL,
      SiglaEstado CHAR(02) NULL,
      CodigoIBGE TINYINT NULL,
      Inativo BIT DEFAULT 00,   
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Estados PRIMARY KEY(IdEstado),
   CONSTRAINT FK_Estados_Paises FOREIGN KEY(IdPais) REFERENCES enderecos.Paises(IdPais),
   CONSTRAINT FK_Estados_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
GO