IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'TurmasPlanos')
BEGIN
   CREATE TABLE academy.TurmasPlanos (
      IdTurmaPlano SMALLINT IDENTITY(01, 01),
      IdTurma SMALLINT NOT NULL,
      IdPlano TINYINT NOT NULL,
      ValorTurmaPlano DECIMAL(13, 04) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_TurmasPlanos PRIMARY KEY(IdTurmaPlano),
   CONSTRAINT FK_TurmasPlanos_Turmas FOREIGN KEY(IdTurma) REFERENCES academy.Turmas(IdTurma),
   CONSTRAINT FK_TurmasPlanos_Planos FOREIGN KEY(IdPlano) REFERENCES academy.Planos(IdPlano),
   CONSTRAINT FK_TurmasPlanos_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
