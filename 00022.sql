IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'FormasPagtos')
BEGIN
   CREATE TABLE common.FormasPagamentos (
      IdFormaPagamento TINYINT IDENTITY(01, 01) NOT NULL,
      NomeFormaPagamento VARCHAR(50) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_FormasPagtos PRIMARY KEY (IdFormaPagamento),
   CONSTRAINT FK_FormasPagtos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END