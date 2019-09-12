IF NOT EXISTS (SELECT 01 FROM sys.Indexes WHERE NAME = 'idx_NomeEstado')
BEGIN
   CREATE NONCLUSTERED INDEX idx_NomeEstado ON enderecos.Estados (NomeEstado) INCLUDE (IdPais)
END