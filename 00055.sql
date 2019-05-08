CREATE TABLE PessoasTerminais (
   IdPessoaTerminal INTEGER IDENTITY(01, 01),
   IdPessoa INTEGER NOT NULL,
   IdTerminal TINYINT NULL,
CONSTRAINT PK_PessoasTerminais PRIMARY KEY(IdPessoaTerminal),
CONSTRAINT FK_PessoasTerminais_Pessoas FOREIGN KEY(IdPessoa) REFERENCES Pessoas(IdPessoa),
CONSTRAINT FK_PessoasTerminais_Terminais FOREIGN KEY(IdTerminal) REFERENCES Terminais(IdTerminal))