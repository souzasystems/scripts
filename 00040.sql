IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'ProdutosLancamentos')
BEGIN
   CREATE TABLE Common.ProdutosLancamentos (
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
   CONSTRAINT FK_ProdutosLancamentos_Lancamentos FOREIGN KEY (IdLancamento) REFERENCES Common.Lancamentos(IdLancamento),
   CONSTRAINT FK_ProdutosLancamentos_Produtos FOREIGN KEY (IdProduto) REFERENCES Common.Produtos(IdProduto),
   CONSTRAINT FK_ProdutosLancamentos_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END