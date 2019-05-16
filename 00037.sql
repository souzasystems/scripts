IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'EquipamentosLancamentos')
BEGIN
   CREATE TABLE common.EquipamentosLancamentos (
      IdEquipamentoLancamento INTEGER IDENTITY(01, 01),
      IdEquipamento SMALLINT NOT NULL,
      IdLancamento INTEGER NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_EquipamentosLancamentos PRIMARY KEY (IdEquipamentoLancamento),
   CONSTRAINT FK_EquipamentosLancamentos_Lancamentos FOREIGN KEY(IdLancamento) REFERENCES common.Lancamentos(IdLancamento),
   CONSTRAINT FK_EquipamentosLancamentos_Equipamentos FOREIGN KEY(IdEquipamento) REFERENCES common.Equipamentos(IdEquipamento),
   CONSTRAINT FK_EquipamentosLancamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END