IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'EnderecosFuncionarios')
BEGIN
   CREATE TABLE enderecos.EnderecosFuncionarios (
      IdEnderecoFuncionario INTEGER IDENTITY(01, 01),
      IdFuncionario SMALLINT NOT NULL,
      IdVia INTEGER NOT NULL,
      IdTipoEndereco TINYINT NOT NULL,
      IdLoteamento SMALLINT NULL,
      IdLote SMALLINT NULL,
      IdQuadra SMALLINT NULL,
      IdCondominio SMALLINT NULL,
      IdDistrito SMALLINT NULL,
      Numero INTEGER NULL,
      Complemento VARCHAR(30) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_EnderecosFuncionarios PRIMARY KEY(IdEnderecoFuncionario),
   CONSTRAINT FK_EnderecosFuncionarios_Vias FOREIGN KEY(IdVia) REFERENCES enderecos.Vias(IdVia),
   CONSTRAINT FK_EnderecosFuncionarios_Funcionarios FOREIGN KEY(IdFuncionario) REFERENCES common.Funcionarios(IdFuncionario),
   CONSTRAINT FK_EnderecosFuncionarios_TiposEndereco FOREIGN KEY(IdTipoEndereco) REFERENCES enderecos.TiposEndereco(IdTipoEndereco),
   CONSTRAINT FK_EnderecosFuncionarios_Loteamento FOREIGN KEY(IdLoteamento) REFERENCES enderecos.Loteamentos(IdLoteamento),
   CONSTRAINT FK_EnderecosFuncionarios_Lote FOREIGN KEY(IdLote) REFERENCES enderecos.Lotes(IdLote),
   CONSTRAINT FK_EnderecosFuncionarios_Quadra FOREIGN KEY(IdQuadra) REFERENCES enderecos.Quadras(IdQuadra),
   CONSTRAINT FK_EnderecosFuncionarios_Condominio FOREIGN KEY(IdCondominio) REFERENCES enderecos.Condominios(IdCondominio),
   CONSTRAINT FK_EnderecosFuncionarios_Distrito FOREIGN KEY(IdDistrito) REFERENCES enderecos.Distritos(IdDistrito))
END