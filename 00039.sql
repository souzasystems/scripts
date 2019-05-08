IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'SetoresLancamentos')
BEGIN
   CREATE TABLE Common.SetoresLancamentos (
      IdSetorLancamento INTEGER IDENTITY(01, 01),
      IdSetor SMALLINT NOT NULL,
      IdLancamento INTEGER NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_SetoresLancamentos PRIMARY KEY (IdSetorLancamento),
   CONSTRAINT FK_SetoresLancamentos_Lancamentos FOREIGN KEY(IdLancamento) REFERENCES Common.Lancamentos(IdLancamento),
   CONSTRAINT FK_SetoresLancamentos_Setores FOREIGN KEY(IdSetor) REFERENCES Common.Setores(IdSetor),
   CONSTRAINT FK_SetoresLancamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END