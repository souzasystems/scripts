IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Lancamentos')
BEGIN
   CREATE TABLE Common.Lancamentos (
      IdLancamento INTEGER IDENTITY(01, 01),
      IdFormaPagamento TINYINT NOT NULL,
      TipoLancamento VARCHAR(05) NULL,
      DataEmissao DATE NULL,   
      NumeroNotaFiscal VARCHAR(20) NULL,
      DataPagamento DATE NULL,
      DataVencimento DATE NULL,
      Observacoes VARCHAR(MAX) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Lancamentos PRIMARY KEY (IdLancamento),
   CONSTRAINT FK_Lancamentos_FormasPagtos FOREIGN KEY(IdFormaPagamento) REFERENCES Common.FormasPagamentos(IdFormaPagamento),
   CONSTRAINT FK_Lancamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END