IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Distritos')
BEGIN
   CREATE TABLE enderecos.Distritos (
      IdDistrito SMALLINT IDENTITY(01, 01) NOT NULL,
      IdCidade SMALLINT NOT NULL,
      NomeDistrito VARCHAR(50) NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Distritos PRIMARY KEY(IdDistrito),
   CONSTRAINT FK_Distritos_Cidades FOREIGN KEY(IdCidade) REFERENCES enderecos.Cidades(IdCidade),
   CONSTRAINT FK_Distritos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END