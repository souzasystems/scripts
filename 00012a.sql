IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Vias')
BEGIN
   CREATE TABLE enderecos.Vias (
      IdVia INTEGER IDENTITY(01, 01) NOT NULL,
      IdLogradouro SMALLINT NOT NULL,
      IdBairro INTEGER NOT NULL,
      NomeVia VARCHAR(60) NULL,
      Cep CHAR(08) NULL,
      Inativa BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Vias PRIMARY KEY(IdVia),
   CONSTRAINT FK_Vias_Logradouros FOREIGN KEY(IdLogradouro) REFERENCES enderecos.Logradouros(IdLogradouro),
   CONSTRAINT FK_Vias_Bairros FOREIGN KEY(IdBairro) REFERENCES enderecos.Bairros(IdBairro),
   CONSTRAINT FK_Vias_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END