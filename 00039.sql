IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'SetoresLancamentos')
BEGIN
   CREATE TABLE common.SetoresLancamentos (
      IdSetorLancamento INTEGER IDENTITY(01, 01),
      IdSetor SMALLINT NOT NULL,
      IdLancamento INTEGER NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_SetoresLancamentos PRIMARY KEY (IdSetorLancamento),
   CONSTRAINT FK_SetoresLancamentos_Lancamentos FOREIGN KEY(IdLancamento) REFERENCES common.Lancamentos(IdLancamento),
   CONSTRAINT FK_SetoresLancamentos_Setores FOREIGN KEY(IdSetor) REFERENCES common.Setores(IdSetor),
   CONSTRAINT FK_SetoresLancamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END