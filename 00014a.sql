IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Lotes')
BEGIN
   CREATE TABLE enderecos.Lotes (
      IdLote SMALLINT IDENTITY(01, 01),
      IdLoteamento SMALLINT NOT NULL,
      DescricaoLote VARCHAR(25) NULL,
      Complemento VARCHAR(20) NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Lotes PRIMARY KEY(IdLote),
   CONSTRAINT FK_Lotes_Loteamentos FOREIGN KEY(IdLoteamento) REFERENCES enderecos.Loteamentos(IdLoteamento),
   CONSTRAINT FK_Lotes_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END