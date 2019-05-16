IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'CentrosCustoProdutos')
BEGIN
   CREATE TABLE common.CentrosCustoProdutos (
      IdCentroCustoProduto INTEGER IDENTITY(01, 01),
      IdCentroCusto SMALLINT NOT NULL,
      IdProduto INTEGER NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_CentrosCustoProdutos PRIMARY KEY (IdCentroCustoProduto),
   CONSTRAINT FK_CentrosCustoProdutos_CentrosCusto FOREIGN KEY (IdCentroCusto) REFERENCES common.CentrosCusto(IdCentroCusto),
   CONSTRAINT FK_CentrosCustoProdutos_Produtos FOREIGN KEY (IdProduto) REFERENCES common.Produtos(IdProduto),
   CONSTRAINT FK_CentrosCustoProdutos_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
