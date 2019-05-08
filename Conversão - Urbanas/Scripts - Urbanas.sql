CREATE TABLE Usuarios ( --Usuario
   IdUsuario SMALLINT IDENTITY(01, 01), --Id
   NomeUsuario CHAR(30) NULL, --NomeUsuario
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NOT NULL,
   LgData DATETIME NOT NULL,
   LgHora VARCHAR(08) NOT NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Usuarios PRIMARY KEY(IdUsuario),
CONSTRAINT FK_Usuarios_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Secretarias ( --Secretaria
   IdSecretaria TINYINT IDENTITY(01, 01), --Id
   NomeSecretariao VARCHAR(150) NULL, --NomeSecretaria
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NOT NULL,
   LgData DATETIME NOT NULL,
   LgHora VARCHAR(08) NOT NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Secretarias PRIMARY KEY(IdSecretaria),
CONSTRAINT FK_Secretarias_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Cargos ( --Cargo
   IdCargo TINYINT IDENTITY(01, 01), --Id
   NomeCargo VARCHAR(150) NULL, --NomeCargo
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NOT NULL,
   LgData DATETIME NOT NULL,
   LgHora VARCHAR(08) NOT NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Cargos PRIMARY KEY(IdCargo),
CONSTRAINT FK_Cargos_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Departamentos ( --Departamento
   IdDepartamento TINYINT IDENTITY(01, 01), --Id
   NomeDepartamento VARCHAR(150) NULL, --NomeDepartamento
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NOT NULL,
   LgData DATETIME NOT NULL,
   LgHora VARCHAR(08) NOT NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Departamentos PRIMARY KEY(IdDepartamento),
CONSTRAINT FK_Departamentos_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE TiposZona (
   IdTipoZona TINYINT IDENTITY(01, 01),
   DescricaoTipoZona VARCHAR(25) NULL,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_TiposZona PRIMARY KEY(IdTipoZona),
CONSTRAINT FK_TiposZonas_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Zonas ( --Zona
   IdZona SMALLINT IDENTITY(01, 01), --Id
   IdTipoZona TINYINT NULL, --TipoZona
   DescricaoZona VARCHAR(50) NULL, --DescricaoZona
   Inativa BIT DEFAULT 00,
   AreaMinima DECIMAL(15, 03) NULL, --AreaMinima
   TestadaMinima DECIMAL(15, 03) NULL, --TestadaMinima
   ComplementoAreaMinima VARCHAR(8) NULL, --ComplementoAreaMinima
   IdentificadorZona VARCHAR(10) NULL, --Zona
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Zonas PRIMARY KEY(IdZona),
CONSTRAINT FK_Zonas_TiposZonas FOREIGN KEY(IdTipoZona) REFERENCES TiposZona(IdTipoZona),
CONSTRAINT FK_Zonas_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Logradouros ( --Lograd
   IdLogradouro SMALLINT IDENTITY(01, 01) NOT NULL, --Id
   DescricaoLogradouro VARCHAR(25) NULL, --DescLogradouro
   AbreviaturaLogradouro VARCHAR(10) NULL, --Logradouro
   Inativo BIT DEFAULT 00,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Logradouros PRIMARY KEY(IdLogradouro),
CONSTRAINT FK_Logradouros_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))


CREATE TABLE Paises (
   IdPais SMALLINT IDENTITY(01, 01) NOT NULL,
   NomePais VARCHAR(50) NULL,
   Sigla02 CHAR(02) NULL,
   Sigla03 CHAR(03) NULL,
   CodIso3166 SMALLINT NULL,
   NumDDI SMALLINT NULL,
   Inativo BIT DEFAULT 00,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Paises PRIMARY KEY(IdPais),
CONSTRAINT FK_Paises_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Estados (
   IdEstado SMALLINT IDENTITY(01, 01) NOT NULL,
   IdPais SMALLINT NOT NULL,
   NomeEstado VARCHAR(20) NULL,
   SiglaEstado CHAR(02) NULL,
   CodIBGE TINYINT NULL,
   Inativo BIT DEFAULT 00,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Estados PRIMARY KEY(IdEstado),
CONSTRAINT FK_Estados_Paises FOREIGN KEY(IdPais) REFERENCES Paises(IdPais),
CONSTRAINT FK_Estados_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Cidades (
   IdCidade SMALLINT IDENTITY(01, 01) NOT NULL,
   IdEstado SMALLINT NOT NULL,
   NomeCidade VARCHAR(45) NULL,
   CodIBGE INTEGER NULL,
   NumDDD TINYINT NULL,
   Inativa BIT DEFAULT 00,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Cidades PRIMARY KEY(IdCidade),
CONSTRAINT FK_Cidades_Estados FOREIGN KEY(IdEstado) REFERENCES Estados(IdEstado),
CONSTRAINT FK_Cidades_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Bairros (
   IdBairro INTEGER IDENTITY(01, 01) NOT NULL,
   IdCidade SMALLINT NOT NULL,
   NomeBairro VARCHAR(70) NULL,
   DataVigoracao DATETIME NULL,
   Inativo BIT DEFAULT 00,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Bairros PRIMARY KEY(IdBairro),
CONSTRAINT FK_Bairros_Cidades FOREIGN KEY(IdCidade) REFERENCES Cidades(IdCidade),
CONSTRAINT FK_Bairros_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE TiposVia (
   IdTipoVia TINYINT IDENTITY(01, 01),
   DescricaoTipoVia VARCHAR(25) NULL,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_TiposVia PRIMARY KEY(IdTipoVia)
CONSTRAINT FK_TiposVia_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Vias ( --Via
   IdVia INTEGER IDENTITY(01, 01) NOT NULL, --CodigoVia
   IdBairro INTEGER NOT NULL, --CodigoBairro
   IdLogradouro SMALLINT NOT NULL, --Logradouro
   IdZona SMALLINT NULL, --Zona
   IdZonaNova SMALLINT NULL, --ZonaNova
   IdTipoVia TINYINT NULL, --Tipo
   DescricaoVia VARCHAR(60) NULL, --DescricaoVia
   DataVigoracao DATETIME NULL, --DataVigoracao
   Cep CHAR(08) NULL, --Cep
   Inativa BIT DEFAULT 00, --Inativo
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Vias PRIMARY KEY(IdVia),
CONSTRAINT FK_Vias_Bairros FOREIGN KEY(IdBairro) REFERENCES Bairros(IdBairro),
CONSTRAINT FK_Vias_Logradouros FOREIGN KEY(IdLogradouro) REFERENCES Logradouros(IdLogradouro),
CONSTRAINT FK_Vias_Zonas FOREIGN KEY(IdZona) REFERENCES Zonas(IdZona),
CONSTRAINT FK_Vias_ZonasNova FOREIGN KEY(IdZonaNova) REFERENCES Zonas(IdZona),
CONSTRAINT FK_Vias_TiposVia FOREIGN KEY(IdTipoVia) REFERENCES TiposVia(IdTipoVia),
CONSTRAINT FK_Vias_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE TiposReferencia ( --TipoReferencia
   IdTipoReferencia TINYINT IDENTITY(01, 01), --Id
   DescricaoTipoReferencia VARCHAR(60), --Descricao
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_TiposReferencia PRIMARY KEY(IdTipoReferencia),
CONSTRAINT FK_TiposReferencia_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE ReferenciasVia ( --ViaTipoReferencia
   IdReferenciaVia SMALLINT IDENTITY(01, 01), --Id
   IdTipoReferencia TINYINT NOT NULL, --idTipoReferencia
   IdVia INTEGER NOT NULL, --CodigoVia
   DescricaoReferencia VARCHAR(100) NULL, --Descricao
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_ReferenciasVia PRIMARY KEY(IdReferenciaVia),
CONSTRAINT FK_ReferenciasVia_TiposReferencia FOREIGN KEY(IdTipoReferencia) REFERENCES TiposReferencia(IdTipoReferencia),
CONSTRAINT FK_ReferenciasVia_Vias FOREIGN KEY(IdVia) REFERENCES Vias(IdVia),
CONSTRAINT FK_ReferenciasVia_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE ViasVizinhas ( --ViaVizinhas
   IdViaVizinha INTEGER IDENTITY(01, 01), --Id
   IdVia INTEGER NOT NULL, --CodigoVia
   IdViaVizinhanca INTEGER NOT NULL, --CodigoViaViz
   Direcao TINYINT NULL, --Direcao
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_ViasVizinhas PRIMARY KEY(IdViaVizinha),
CONSTRAINT FK_ViasVizinhas_Vias FOREIGN KEY(IdVia) REFERENCES Vias(IdVia),
CONSTRAINT FK_ViasVizinhas_ViaVizinhanca FOREIGN KEY(IdViaVizinhanca) REFERENCES Vias(IdVia),
CONSTRAINT FK_ViasVizinhas_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Modelos ( --Modelo
   IdModelo SMALLINT IDENTITY(01, 01), --Id
   CodigoModelo VARCHAR(10) NOT NULL, --Modelo
   Observacao VARCHAR(MAX) NULL, --Obs
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Modelos PRIMARY KEY(IdModelo),
CONSTRAINT FK_Modelos_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Assuntos ( --Assunto
   IdAssunto SMALLINT IDENTITY(01, 01), --Id
   CodigoAssunto VARCHAR(04) NOT NULL, --CodigoAssunto
   DescricaoAssunto VARCHAR(70) NOT NULL, --NomeAssunto
   ExpansaoUrbana BIT DEFAULT 00, --EXPAN
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Assuntos PRIMARY KEY(IdAssunto),
CONSTRAINT FK_Assuntos_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE ClassificacoesProfissional (
   IdClassificacaoProfissional TINYINT IDENTITY(01, 01),
   DescClassificacaoProfissional VARCHAR(60),
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_ClassificacoesProfissional PRIMARY KEY(IdClassificacaoProfissional),
CONSTRAINT FK_ClassificacoesProfissional_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Profissionais ( --Engenhei
   IdProfissional SMALLINT IDENTITY(01, 01), --Id
   IdIdClassificacaoProfissional TINYINT NULL, --Classificacao
   CREA VARCHAR(10) NULL, --Crea
   NomeProfissional VARCHAR(60) NULL, --NomeEngenheiro
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Profissionais PRIMARY KEY(IdProfissional),
CONSTRAINT FK_Profissionais_ClassificacoesProfissional FOREIGN KEY(IdIdClassificacaoProfissional) REFERENCES ClassificacoesProfissional(IdClassificacaoProfissional),
CONSTRAINT FK_Profissionais_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Usos ( --Uso
   IdUso SMALLINT IDENTITY(01, 01), --Id
   DescricaoUso VARCHAR(100) NULL, --DescricaoUso
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Usos PRIMARY KEY(IdUso),
CONSTRAINT FK_Usos_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Titulos ( --Titulo
   IdTitulo SMALLINT IDENTITY(01, 01), --Id
   DescricaoTitulo VARCHAR(100) NULL, --DescricaoTitulo
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Titulos PRIMARY KEY(IdTitulo),
CONSTRAINT FK_Titulos_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Caracteristicas ( --Variav
   IdCaracteristica SMALLINT IDENTITY(01, 01), --Id
   DescricaoCaracteristica VARCHAR(100) NULL, --DescricaoVariavel
   Unidade VARCHAR(02) NULL, --Unidade
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Variaveis PRIMARY KEY(IdVariavel),
CONSTRAINT FK_Variaveis_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE UsosZonas ( --AnexoII
   IdUsoZona SMALLINT IDENTITY(01, 01), --Id
   IdZona SMALLINT NULL, --Zona
   IdUso SMALLINT NULL, --CodigoUso
   IdModelo SMALLINT NULL, --Modelo
   TipoAnexo CHAR(01) NULL, --Tipo
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Anexos PRIMARY KEY(IdAnexo),
CONSTRAINT FK_Anexos_Modelos FOREIGN KEY(IdModelo) REFERENCES Modelos(IdModelo),
CONSTRAINT FK_Anexos_Zonas FOREIGN KEY(IdZona) REFERENCES Zonas(IdZona),
CONSTRAINT FK_Anexos_Usos FOREIGN KEY(IdUso) REFERENCES Usos(IdUso),
CONSTRAINT FK_Variaveis_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Limites (
   IdLimite SMALLINT IDENTITY(01, 01),
   DescricaoLimite VARCHAR(50) NULL,
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Limites PRIMARY KEY(IdLimite),
CONSTRAINT FK_Limites_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE UsosCaracteristicas ( --AnexoIV
   IdUsoCaracteristica SMALLINT IDENTITY(01, 01), --Id
   IdModelo SMALLINT NULL, --Modelo
   IdCaracteristica SMALLINT NULL, --CodigoVariavel
   IdLimite SMALLINT NULL, --Limite
   Valor VARCHAR(20) NULL, --Valor
   ValorExibeZero BIT NULL, --ValorExibeZero
   Terreo VARCHAR(20) NULL, --Terreo
   TerreoExibeZero BIT NULL, --TerreoExibeZero
   Demais VARCHAR(20) NULL, --Demais
   DemaisExibeZero BIT NULL, --DemaisExibeZero
   Estacionamento VARCHAR(30) NULL, --Estacionamento
   Complemento VARCHAR(250) NULL, --Caracteristica
   Item VARCHAR(03) NULL, --Item
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_UsosCaracteristicas PRIMARY KEY (IdUsoCaracteristica),
CONSTRAINT FK_UsosCaracteristicas_Modelos FOREIGN KEY(IdModelo) REFERENCES Modelos(IdModelo),
CONSTRAINT FK_UsosCaracteristicas_Caracteristicas FOREIGN KEY(IdCaracteristica) REFERENCES Caracteristicas(IdCaracteristica),
CONSTRAINT FK_UsosCaracteristicas_Limites FOREIGN KEY(IdLimite) REFERENCES Limites(IdLimite),
CONSTRAINT FK_UsosCaracteristicas_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE ExcecoesUsoCaracteristica ( --ExcecI
   IdExcecaoUsoCaracteristica SMALLINT IDENTITY(01, 01), --Id
   IdModelo SMALLINT NULL, --Modelo
   IdCaracteristica SMALLINT NULL, --CodigoVariavel
   IdLimite SMALLINT NULL, --Limite
   Valor DECIMAL(15, 03) NULL, --Valor
   Terreo DECIMAL(15, 03) NULL, --Terreo
   Demais DECIMAL(15, 03) NULL, --Demais
   Observacoes VARCHAR(30) NULL, --Texto
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_ExcecoesUsoCaracteristica PRIMARY KEY (IdExcecaoUsoCaracteristica),
CONSTRAINT FK_ExcecoesUsoCaracteristica_Modelos FOREIGN KEY(IdModelo) REFERENCES Modelos(IdModelo),
CONSTRAINT FK_ExcecoesUsoCaracteristica_Caracteristicas FOREIGN KEY(IdCaracteristica) REFERENCES Caracteristicas(IdCaracteristica),
CONSTRAINT FK_ExcecoesUsoCaracteristica_Limites FOREIGN KEY(IdLimite) REFERENCES Limites(IdLimite),
CONSTRAINT FK_ExcecoesUsoCaracteristica_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE ExecoesZona ( --ExcecII
   IdExcecaoZona SMALLINT IDENTITY(01, 01), --Id
   IdBairro INTEGER NULL, --CodigoBairro
   IdVia INTEGER NULL, --CodigoVia
   IdZona SMALLINT NULL, --Zona
   IdLimite SMALLINT NULL, --Limite
   IdCaracteristica SMALLINT NULL, --CodigoVariavel
   Observacoes VARCHAR(30) NULL, --Texto
   Valor DECIMAL(15, 03) NULL, --Valor
   Terreo DECIMAL(15, 03) NULL, --Terreo
   Demais DECIMAL(15, 03) NULL, --Demais
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_ExecoesZona PRIMARY KEY (IdExcecaoZona),
CONSTRAINT FK_ExecoesZona_Bairros FOREIGN KEY(IdBairro) REFERENCES Bairros(IdBairro),
CONSTRAINT FK_ExecoesZona_Vias FOREIGN KEY(IdVia) REFERENCES Vias(IdVia),
CONSTRAINT FK_ExecoesZona_Zonas FOREIGN KEY(IdZona) REFERENCES Zonas(IdZona),
CONSTRAINT FK_ExecoesZona_Caracteristicas FOREIGN KEY(IdCaracteristica) REFERENCES Caracteristicas(IdCaracteristica),
CONSTRAINT FK_ExecoesZona_Limites FOREIGN KEY(IdLimite) REFERENCES Limites(IdLimite),
CONSTRAINT FK_ExecoesZona_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE Restricoes ( --Restric
   IdRestricao SMALLINT IDENTITY(01, 01), --Id
   IdZona SMALLINT NULL, --Zona
   IdModelo SMALLINT NULL, --Modelo
   IdUso SMALLINT NULL, --CodigoUso
   IdBairro INTEGER NULL, --CodigoBairro
   IdVia INTEGER NULL, --CodigoVia
   Quadra CHAR(05) NULL, --QuadraLoc
   Observacao VARCHAR(MAX) NULL, --Texto
   Incluido BIT NULL, --Incluido
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_Restricoes PRIMARY KEY (IdRestricao),
CONSTRAINT FK_Restricoes_Zonas FOREIGN KEY(IdZona) REFERENCES Zonas(IdZona),
CONSTRAINT FK_Restricoes_Modelos FOREIGN KEY(IdModelo) REFERENCES Modelos(IdModelo),
CONSTRAINT FK_Restricoes_Uso FOREIGN KEY(IdUso) REFERENCES Usos(IdUso),
CONSTRAINT FK_Restricoes_Bairros FOREIGN KEY(IdBairro) REFERENCES Bairros(IdBairro),
CONSTRAINT FK_Restricoes_Vias FOREIGN KEY(IdVia) REFERENCES Vias(IdVia),
CONSTRAINT FK_Restricoes_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE InformacoesVia ( --ViaTab
   IdInformacaoVia SMALLINT IDENTITY(01, 01), --Id
   DescricaoInfoVia VARCHAR(40) NULL, --Descricao
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_InformacoesVia PRIMARY KEY(IdInformacaoVia),
CONSTRAINT FK_InformacoesVia_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE CaracteristicasVia ( --ViaTab
   IdCaracteristicaVia SMALLINT IDENTITY(01, 01), --Id
   IdInformacaoVia SMALLINT NOT NULL,
   DescricaoCaracterVia VARCHAR(40) NULL, --Descricao
   Obrigatoria BIT NULL, --Obrigat
   Abreviatura VARCHAR(20) NULL, --Abreviatura
   NomeVariavel VARCHAR(20) NULL, --NomeVariavel
   ExibirFormulario BIT NULL, --CtrlBci
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),
CONSTRAINT PK_CaracteristicasVia PRIMARY KEY(IdCaracteristicaVia),
CONSTRAINT FK_CaracteristicasVia_InformacoesVia FOREIGN KEY(IdInformacaoVia) REFERENCES InformacoesVia(IdInformacaoVia),
CONSTRAINT FK_CaracteristicasVia_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

CREATE TABLE DadosCaracteristicaVia (
   IdDadoCaracteristicaVia TINYINT IDENTITY(01, 01), --Id
   IdCaracteristicaVia SMALLINT NOT NULL,
   DescricaoDadoCaracterVia VARCHAR(40) NULL, --Descricao
   Valor DECIMAL(15, 03) NULL, --Percentual
   Abreviatura VARCHAR(20) NULL, --Abreviatura
   ExibirFormulario BIT NULL, --CtrlBci
   LgIdUsuario SMALLINT NOT NULL,
   LgRotina VARCHAR(01) NULL,
   LgData DATETIME NULL,
   LgHora VARCHAR(08) NULL,
   LgMotivoExclusao VARCHAR(MAX) NULL,
   LgAnoExercicio SMALLINT NULL,
   ConCurrencyId VARCHAR(50) NOT NULL DEFAULT NEWID(),   
CONSTRAINT PK_DadosCaracteristicaVia PRIMARY KEY(IdDadoCaracteristicaVia),
CONSTRAINT FK_DadosCaracteristicaVia_CaracteristicasVia FOREIGN KEY(IdCaracteristicaVia) REFERENCES CaracteristicasVia(IdCaracteristicaVia),
CONSTRAINT FK_CaracteristicasVia_Usuarios FOREIGN KEY(LgIdUsuario) REFERENCES Usuarios(IdUsuario))

INSERT INTO Usuarios(NomeUsuario, LgIdUsuario, LgRotina, LgDataHora, LgAnoExercicio)
VALUES('SNDESENV', (SELECT IDENT_CURRENT ('Usuarios')), 'I', GETDATE(), 2018)

INSERT INTO TiposZona (DescricaoTipoZona)
VALUES ('INDUSTRIAL'),
       ('COMERCIAL'),
       ('RESIDENCIAL'),
       ('TURÍSTICO');


