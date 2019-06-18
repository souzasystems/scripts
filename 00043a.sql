IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Planos')
BEGIN
   CREATE TABLE academy.Planos (
      IdPlano TINYINT IDENTITY(01, 01),
      NomePlano VARCHAR(25) NULL,
      PermiteDesconto BIT DEFAULT 01,
      NumeroDiasBloqueio SMALLINT NULL,
      NumeroDiasInativacao SMALLINT NULL,
      NumeroDiasCorrido SMALLINT NULL,
      ConsideraSabado BIT NULL DEFAULT 01,
      ConsideraDomingo BIT NULL DEFAULT 01,
      ConsideraFeriados BIT NULL DEFAULT 01,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Planos PRIMARY KEY(IdPlano),
   CONSTRAINT FK_Planos_Usuarios FOREIGN KEY (LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END
