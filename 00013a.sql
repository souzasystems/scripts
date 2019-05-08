IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Loteamentos')
BEGIN
   CREATE TABLE enderecos.Loteamentos (
      IdLoteamento SMALLINT IDENTITY(01, 01),
      IdQuadra SMALLINT NOT NULL,   
      DescricaoLoteamento VARCHAR(50) NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Loteamentos PRIMARY KEY(IdLoteamento),
   CONSTRAINT FK_Loteamentos_Quadras FOREIGN KEY(IdQuadra) REFERENCES enderecos.Quadras(IdQuadra),
   CONSTRAINT FK_Loteamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END