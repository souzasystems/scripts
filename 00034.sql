IF NOT EXISTS(SELECT 01 FROM sys.Tables WHERE Name = 'Equipamentos')
BEGIN
   CREATE TABLE common.Equipamentos (
      IdEquipamento SMALLINT IDENTITY(01, 01),
      NomeEquipamento VARCHAR(100) NULL,
      LogIdUsuario SMALLINT NOT NULL,
      LogRotina VARCHAR(01) NOT NULL,
      LogDataHora DATETIME DEFAULT (SYSDATETIME()),
      LogMotivoExclusao VARCHAR(MAX) NULL,
      ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   CONSTRAINT PK_Equipamentos PRIMARY KEY (IdEquipamento),
   CONSTRAINT FK_Equipamentos_Usuarios FOREIGN KEY(LogIdUsuario) REFERENCES common.Usuarios(IdUsuario))
END