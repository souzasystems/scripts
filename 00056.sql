CREATE TABLE PessoasTurmasPlanos (
   IdPessoaTurmaPlano INTEGER IDENTITY(01, 01),
   IdPessoa INTEGER NOT NULL,
   IdTurmaPlano SMALLINT NOT NULL,
CONSTRAINT PK_PessoasTurmasPlanos PRIMARY KEY(IdPessoaTurmaPlano),
CONSTRAINT FK_PessoasTurmasPlanos_Pessoas FOREIGN KEY(IdPessoa) REFERENCES Pessoas(IdPessoa),
CONSTRAINT FK_PessoasTurmasPlanos_TurmasPlanos FOREIGN KEY(IdTurmaPlano) REFERENCES TurmasPlanos(IdTurmaPlano))