IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Pessoas')
BEGIN
   CREATE TABLE Common.Pessoas (
      IdPessoa INTEGER IDENTITY(01, 01),
      Ativo BIT DEFAULT 01,
      DataCadastro DATE NULL,
      Email VARCHAR(80) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Pessoas PRIMARY KEY(IdPessoa),
   CONSTRAINT FK_Pessoas_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END
