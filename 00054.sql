CREATE TABLE TelefonesPessoas (
   IdTelefonePessoa SMALLINT IDENTITY(01, 01),
   IdPessoa INTEGER NOT NULL,
   IdTipoTelefone TINYINT NOT NULL,
   DDDTelefone TINYINT NULL,
   DDITelefone SMALLINT NULL,
   NumTelefone VARCHAR(09) NULL,
CONSTRAINT PK_TelefonesPessoas PRIMARY KEY(IdTelefonePessoa),
CONSTRAINT FK_TelefonesPessoas_TiposTelefone FOREIGN KEY(IdTipoTelefone) REFERENCES TiposTelefone(IdTipoTelefone),
CONSTRAINT FK_TelefonesPessoas_Pessoas FOREIGN KEY(IdPessoa) REFERENCES Pessoas(IdPessoa))