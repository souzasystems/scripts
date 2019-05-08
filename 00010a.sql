IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Logradouros')
BEGIN
   CREATE TABLE enderecos.Logradouros (
      IdLogradouro SMALLINT IDENTITY(01, 01) NOT NULL,
      DescricaoLogradouro VARCHAR(25) NULL,
      AbreviaturaLogradouro VARCHAR(10) NULL,
      Inativo BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Logradouros PRIMARY KEY(IdLogradouro),
   CONSTRAINT FK_Logradouros_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END