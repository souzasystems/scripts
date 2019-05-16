IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'TiposEndereco')
BEGIN
   CREATE TABLE enderecos.TiposEndereco (
      IdTipoEndereco TINYINT IDENTITY(01, 01),
      DescricaoTipoEndereco VARCHAR(25) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),   
   CONSTRAINT PK_TiposEndereco PRIMARY KEY(IdTipoEndereco),
   CONSTRAINT FK_TiposEndereco_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
GO