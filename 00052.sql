IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'PessoasJuridicas')
BEGIN
   CREATE TABLE common.PessoasJuridicas (
      IdPessoaJuridica INTEGER IDENTITY(01, 01),
      IdPessoa INTEGER NOT NULL,
      Cnpj VARCHAR(14) NULL,
      RazaoSocial VARCHAR(115) NULL,
      InscMunicipal VARCHAR(20) NULL,
      InscEstadual VARCHAR(20) NULL,   
      NomeFantasia VARCHAR(50) NULL,
      DataFundacao DATE NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_PessoasJuridicas PRIMARY KEY(IdPessoaJuridica),
   CONSTRAINT FK_PessoasJuridicas_Pessoas FOREIGN KEY(IdPessoa) REFERENCES common.Pessoas(IdPessoa),
   CONSTRAINT FK_PessoasJuridicas_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
