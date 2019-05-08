IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'MovimentosCaixa')
BEGIN
   CREATE TABLE Common.MovimentosCaixa (
      IdMovimentoCaixa INTEGER IDENTITY(01, 01) NOT NULL,
      IdFuncionario SMALLINT NOT NULL,
      TipoMovimento CHAR(01) NULL,
      DataMovimento DATE,
      ValorMovimento NUMERIC(10, 03),
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_MovimentosCaixa PRIMARY KEY(IdMovimentoCaixa),
   CONSTRAINT FK_MovimentosCaixa_Funcionarios FOREIGN KEY(IdFuncionario) REFERENCES Common.Funcionarios(IdFuncionario),
   CONSTRAINT FK_MovimentosCaixa_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END

