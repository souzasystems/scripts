IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Usuarios')
BEGIN
   CREATE TABLE common.Usuarios (
      IdUsuario SMALLINT IDENTITY(01, 01),
      NomeUsuario VARCHAR(30) NULL,
      Privilegio CHAR(01) NULL,
      Senha VARCHAR(128) NULL,
      Inativo BIT DEFAULT 00,
      DataInicio DATETIME NULL,
      DataExpiracao DATETIME NULL,
      QuantidadeConexoes TINYINT DEFAULT 01,
      QuantidadeConectado TINYINT DEFAULT 00,
      AlterarSenhaPrimeiroLogon BIT DEFAULT 00,
      SenhaPorTrintaDias BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),   
   CONSTRAINT PK_Usuarios PRIMARY KEY(IdUsuario),
   CONSTRAINT FK_Usuarios_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
GO