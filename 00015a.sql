IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Condominios')
BEGIN
   CREATE TABLE enderecos.Condominios (
      IdCondominio SMALLINT IDENTITY(01, 01) NOT NULL,
      IdBairro INTEGER NOT NULL,      
      NomeCondominio VARCHAR(50) NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Condominios PRIMARY KEY(IdCondominio),
   CONSTRAINT FK_Condominios_Bairros FOREIGN KEY(IdBairro) REFERENCES enderecos.Bairros(IdBairro),
   CONSTRAINT FK_Condominios_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END