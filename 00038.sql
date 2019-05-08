IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'CentrosCustoLancamentos')
BEGIN
   CREATE TABLE Common.CentrosCustoLancamentos (
      IdCentroCustoLancamento INTEGER IDENTITY(01, 01),
      IdCentroCusto SMALLINT NOT NULL,
      IdLancamento INTEGER NOT NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_CentrosCustoLancamentos PRIMARY KEY (IdCentroCustoLancamento),
   CONSTRAINT FK_CentrosCustoLancamentos_Lancamentos FOREIGN KEY(IdLancamento) REFERENCES Common.Lancamentos(IdLancamento),
   CONSTRAINT FK_CentrosCustoLancamentos_CentrosCusto FOREIGN KEY(IdCentroCusto) REFERENCES Common.CentrosCusto(IdCentroCusto),
   CONSTRAINT FK_CentrosCustoLancamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END