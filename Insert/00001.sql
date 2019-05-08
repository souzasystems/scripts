INSERT INTO PAISES(NOME_PAIS, SIGLA_02, SIGLA_03, COD_ISO_3166, NUM_DDI) VALUES('PAÍS NÃO INFORMADO', 'NF', 'NIF', 00, 00);
INSERT INTO ESTADOS(ID_PAIS, NOME_ESTADO, SIGLA_ESTADO, COD_IBGE, INATIVO) VALUES(01, 'ESTADO NÃO INFORMADO', 'NF', 00, 00);
INSERT INTO CIDADES(ID_ESTADO, NOME_CIDADE, COD_IBGE, NUM_DDD, INATIVA) VALUES(01, 'CIDADE NÃO INFORMADA', 00, 00, 00);
INSERT INTO DISTRITOS(ID_CIDADE, NOME_DISTRITO, INATIVO) VALUES(01, 'DISTRITO NÃO INFORMADO', 00);
INSERT INTO ZONAS(DESC_ZONA, INATIVA) VALUES('ZONA NÃO INFORMADA', 00);
INSERT INTO BAIRROS(ID_CIDADE, ID_DISTRITO, ID_ZONA, NOME_BAIRRO, INATIVO) VALUES(01, 01, 01, 'BAIRRO NÃO INFORMADO', 00);
INSERT INTO LOTEAMENTOS(ID_BAIRRO, DESC_LOTEAMENTO, INATIVO) VALUES(01, 'LOTEAMENTO NÃO INFORMADO', 00);
INSERT INTO LOGRADOUROS(COD_LOGRADOURO, ABREV_LOGRADOURO, DESC_LOGRADOURO) VALUES(00, 'NÃO INFO', 'LOGRADOURO NÃO INFORMADO');
INSERT INTO VIAS(ID_BAIRRO, ID_LOGRADOURO, NOME_VIA, CEP, INATIVA) VALUES(01, 01, 'VIA NÃO INFORMADA', '00000000', 00);
INSERT INTO QUADRAS(ID_BAIRRO, DESC_QUADRA, COMPLEMENTO, INATIVA) VALUES(01, 'QUADRA NÃO INFORMADA', 'NINFO', 00);
INSERT INTO LOTES(ID_BAIRRO, DESC_LOTE, COMPLEMENTO, INATIVO) VALUES(01, 'LOTE NÃO INFORMADO', 'COMPL. NÃO INFORMADO', 00);
INSERT INTO CONDOMINIOS(ID_BAIRRO, NOME_CONDOMINIO, INATIVO) VALUES(01, 'CONDOMÍNIO NÃO INFORMADO', 00);