IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'AtividadesFuncionarios')
BEGIN
   CREATE TABLE academy.AtividadesFuncionarios (
      IdAtividadeFuncionario INTEGER IDENTITY(01, 01),
      IdAtividade SMALLINT NOT NULL,
      IdFuncionario SMALLINT NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID() UNIQUE,
   CONSTRAINT PK_AtividadesFuncionarios PRIMARY KEY(IdAtividadeFuncionario),
   CONSTRAINT FK_AtividadesFuncionarios_Atividades FOREIGN KEY(IdAtividade) REFERENCES academy.Atividades(IdAtividade),
   CONSTRAINT FK_AtividadesFuncionarios_Funcionarios FOREIGN KEY(IdFuncionario) REFERENCES common.Funcionarios(IdFuncionario),
   CONSTRAINT FK_AtividadesFuncionarios_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END