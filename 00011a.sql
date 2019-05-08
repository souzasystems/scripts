IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Quadras')
BEGIN
   CREATE TABLE enderecos.Quadras (
      IdQuadra SMALLINT IDENTITY(01, 01) NOT NULL,
      IdBairro INTEGER NOT NULL,
      DescricaoQuadra VARCHAR(35) NULL,
      Complemento VARCHAR(05) NULL,
      Inativa BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Quadras PRIMARY KEY(IdQuadra),
   CONSTRAINT FK_Quadras_Bairros FOREIGN KEY(IdBairro) REFERENCES enderecos.Bairros(IdBairro),
   CONSTRAINT FK_Quadras_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END