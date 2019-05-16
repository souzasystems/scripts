IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'DescricoesHorarios')
BEGIN
   CREATE TABLE common.DescricoesHorarios (
      IdDescricaoHorario TINYINT IDENTITY(01, 01) NOT NULL,
      DescricaoHorario VARCHAR(50) NULL,
      TipoHorario CHAR(01) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_DescricoesHorarios PRIMARY KEY(IdDescricaoHorario),
   CONSTRAINT FK_DescricoesHorarios_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END