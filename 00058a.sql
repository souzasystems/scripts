IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'TelefonesFuncionarios')
BEGIN
   CREATE TABLE common.TelefonesFuncionarios (
      IdTelefoneFuncionario SMALLINT IDENTITY(01, 01),
      IdFuncionario SMALLINT NOT NULL,
      IdTipoTelefone TINYINT NOT NULL,
      DDDTelefone TINYINT NULL,
      DDITelefone SMALLINT NULL,
      NumeroTelefone VARCHAR(09) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME NOT NULL DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID() UNIQUE,
   CONSTRAINT PK_TelefonesFuncionarios PRIMARY KEY (IdTelefoneFuncionario),
   CONSTRAINT FK_TelefonesFuncionarios_TiposTelefone FOREIGN KEY (IdTipoTelefone) REFERENCES common.TiposTelefone (IdTipoTelefone),
   CONSTRAINT FK_TelefonesFuncionarios_Funcionarios FOREIGN KEY (IdFuncionario) REFERENCES common.Funcionarios(IdFuncionario),
   CONSTRAINT FK_TelefonesFuncionarios_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END