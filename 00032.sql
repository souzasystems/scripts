IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Produtos')
BEGIN
   CREATE TABLE common.Produtos (
      IdProduto INTEGER IDENTITY(01, 01),
      IdGrupo SMALLINT NULL,   
      IdSubGrupo SMALLINT NULL,      
      IdUnidade TINYINT NULL,
      NomeProduto VARCHAR(100) NULL,
      DataCadastro DATE NULL,
      ValorUnitario DECIMAL(07, 03) NULL,
      Servico BIT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Produtos PRIMARY KEY (IdProduto),
   CONSTRAINT FK_Produtos_Grupos FOREIGN KEY(IdGrupo) REFERENCES common.Grupos(IdGrupo),
   CONSTRAINT FK_Produtos_SubGrupos FOREIGN KEY(IdSubGrupo) REFERENCES common.SubGrupos(IdSubGrupo),
   CONSTRAINT FK_Produtos_Unidades FOREIGN KEY(IdUnidade) REFERENCES common.Unidades(IdUnidade),
   CONSTRAINT FK_Produtos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END