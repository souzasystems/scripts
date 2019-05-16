IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'PessoasFisicas')
BEGIN
   CREATE TABLE common.PessoasFisicas (
      IdPessoaFisica INTEGER IDENTITY(01, 01),
      IdPessoa INTEGER NOT NULL,
      IdEstadoCivil TINYINT NULL,
      IdCidade SMALLINT NULL,
      Nome VARCHAR(80) NULL,
      NomePai VARCHAR(80) NULL,
      NomeMae VARCHAR(80) NULL,
      Identidade VARCHAR(20) NULL,   
      Cpf VARCHAR(11) NULL,
      Sexo CHAR(01) NULL,
      DataNasc DATE NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_PessoasFisicas PRIMARY KEY(IdPessoaFisica),
   CONSTRAINT FK_PessoasFisicas_Pessoas FOREIGN KEY(IdPessoa) REFERENCES common.Pessoas(IdPessoa),
   CONSTRAINT FK_PessoasFisicas_EstadosCivis FOREIGN KEY(IdEstadoCivil) REFERENCES common.EstadosCivis(IdEstadoCivil),
   CONSTRAINT FK_PessoasFisicas_Cidades FOREIGN KEY(IdCidade) REFERENCES Enderecos.Cidades(IdCidade),
   CONSTRAINT FK_PessoasFisicas_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
