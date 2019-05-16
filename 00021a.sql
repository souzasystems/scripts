IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Horarios')
BEGIN
   CREATE TABLE common.Horarios (
      IdHorario SMALLINT IDENTITY(01, 01) NOT NULL,
      IdDescricaoHorario TINYINT NOT NULL,
      HoraInicial TIME NULL,
      HoraFinal TIME NULL, 
      DiaSemana TINYINT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Horarios PRIMARY KEY(IdHorario),
   CONSTRAINT FK_Horarios_DescricoesHorarios FOREIGN KEY(IdDescricaoHorario) REFERENCES common.DescricoesHorarios(IdDescricaoHorario),
   CONSTRAINT FK_Horarios_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END