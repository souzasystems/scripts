IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'ProdutosLancamentos')
BEGIN
   CREATE TABLE common.ProdutosLancamentos (
      IdProdutoLancamento INTEGER IDENTITY(01, 01),
      IdLancamento INTEGER NOT NULL,
      IdProduto INTEGER NOT NULL,
      Quantidade DECIMAL(13, 04) NULL,
      ValorCompra DECIMAL(13, 04) DEFAULT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_ProdutosLancamentos PRIMARY KEY (IdProdutoLancamento),
   CONSTRAINT FK_ProdutosLancamentos_Lancamentos FOREIGN KEY (IdLancamento) REFERENCES common.Lancamentos(IdLancamento),
   CONSTRAINT FK_ProdutosLancamentos_Produtos FOREIGN KEY (IdProduto) REFERENCES common.Produtos(IdProduto),
   CONSTRAINT FK_ProdutosLancamentos_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END