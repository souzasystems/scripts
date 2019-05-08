IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'AtividadesFuncionarios')
BEGIN
   CREATE TABLE Academy.AtividadesFuncionarios (
      IdAtividadeFuncionario INTEGER IDENTITY(01, 01),
      IdAtividade SMALLINT NOT NULL,
      IdFuncionario SMALLINT NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_AtividadesFuncionarios PRIMARY KEY(IdAtividadeFuncionario),
   CONSTRAINT FK_AtividadesFuncionarios_Atividades FOREIGN KEY(IdAtividade) REFERENCES Academy.Atividades(IdAtividade),
   CONSTRAINT FK_AtividadesFuncionarios_Funcionarios FOREIGN KEY(IdFuncionario) REFERENCES Common.Funcionarios(IdFuncionario),
   CONSTRAINT FK_AtividadesFuncionarios_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END
