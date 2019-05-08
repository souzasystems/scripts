CREATE TABLE TelefonesFuncionarios (
   IdTelefoneFuncionario SMALLINT IDENTITY(01, 01),
   IdFuncionario SMALLINT NOT NULL,
   IdTipoTelefone TINYINT NOT NULL,
   DDDTelefone TINYINT NULL,
   DDITelefone SMALLINT NULL,
   NumTelefone VARCHAR(09) NULL,
CONSTRAINT PK_TelefonesFuncionarios PRIMARY KEY (IdTelefoneFuncionario),
CONSTRAINT FK_TelefonesFuncionarios_TiposTelefone FOREIGN KEY (IdTipoTelefone) REFERENCES TiposTelefone (IdTipoTelefone),
CONSTRAINT FK_TelefonesFuncionarios_Funcionarios FOREIGN KEY (IdFuncionario) REFERENCES Funcionarios(IdFuncionario))