IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Atividades')
BEGIN
   CREATE TABLE Academy.Atividades (
      IdAtividade SMALLINT IDENTITY(01, 01),
      IdDescricaoHorario TINYINT NOT NULL,
      NomeAtividade VARCHAR(45) NULL,
      Descricao TEXT NULL,
      DataCadastro DATE NULL,
      Inativa BIT DEFAULT 00,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Atividades PRIMARY KEY(IdAtividade),
   CONSTRAINT FK_Atividades_DescHorarios FOREIGN KEY(IdDescricaoHorario) REFERENCES Common.DescricoesHorarios(IdDescricaoHorario),
   CONSTRAINT FK_Atividades_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END
