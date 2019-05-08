IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Bairros')
BEGIN
   CREATE TABLE enderecos.Bairros (
      IdBairro INTEGER IDENTITY(01, 01) NOT NULL,
      IdCidade SMALLINT NOT NULL,
      NomeBairro VARCHAR(70) NULL,
      DataVigoracao DATETIME NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Bairros PRIMARY KEY(IdBairro),
   CONSTRAINT FK_Bairros_Cidades FOREIGN KEY(IdCidade) REFERENCES enderecos.Cidades(IdCidade),
   CONSTRAINT FK_Bairros_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END