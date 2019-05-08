IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'FuncoesFuncionario')
BEGIN
   CREATE TABLE Common.FuncoesFuncionario (
      IdFuncaoFuncionario TINYINT IDENTITY(01, 01) NOT NULL,
      DescricaoFuncaoFuncionario VARCHAR(60),
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_FuncoesFuncionario PRIMARY KEY(IdFuncaoFuncionario),
   CONSTRAINT FK_FuncoesFuncionario_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES Common.Usuarios(IdUsuario))
END