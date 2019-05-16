IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'TurmasAtividades')
BEGIN
   CREATE TABLE academy.TurmasAtividades (
      IdTurmaAtividade SMALLINT IDENTITY(01, 01),
      IdTurma SMALLINT NOT NULL,
      IdAtividade SMALLINT NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_TurmasAtividades PRIMARY KEY(IdTurmaAtividade),
   CONSTRAINT FK_TurmasAtividades_Turmas FOREIGN KEY(IdTurma) REFERENCES academy.Turmas(IdTurma),
   CONSTRAINT FK_TurmasAtividades_Atividades FOREIGN KEY(IdAtividade) REFERENCES academy.Atividades(IdAtividade),
   CONSTRAINT FK_TurmasAtividades_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
