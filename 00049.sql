CREATE TABLE Config (
   IdConfig TINYINT IDENTITY(01, 01) NOT NULL,
   UtilizaDistritos BIT DEFAULT 00,
   UtilizaZonas BIT DEFAULT 00,
   UtilizaLotes BIT DEFAULT 00,
   UtilizaQuadras BIT DEFAULT 00,
   UtilizaLoteamentos BIT DEFAULT 00,
   UtilizaCondominios BIT DEFAULT 00,
   UtilizaGrupos BIT DEFAULT 00,
   UtilizaSubGrupos BIT DEFAULT 00,
   ProdutoValorZero BIT DEFAULT 00,
   NomeDesenvolvedora VARCHAR(60) NULL,
   NumVersao CHAR(06) NULL,
   NumHash VARCHAR(MAX) NULL,
CONSTRAINT PK_Config PRIMARY KEY(IdConfig))