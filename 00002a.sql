IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'TiposTelefone')
BEGIN
   CREATE TABLE common.TiposTelefone (
      IdTipoTelefone TINYINT IDENTITY(01, 01) NOT NULL,
      DescricaoTipoTelefone VARCHAR(25) NULL,
      MascaraTelefone VARCHAR(15) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME NOT NULL DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_TiposTelefone PRIMARY KEY(IdTipoTelefone),
   CONSTRAINT FK_TiposTelefone_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
GO