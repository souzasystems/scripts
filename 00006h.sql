IF NOT EXISTS (SELECT 01 FROM sys.Indexes WHERE NAME = 'idx_NomeCidade')
BEGIN
   CREATE NONCLUSTERED INDEX idx_NomeCidade ON enderecos.Cidades (NomeCidade) INCLUDE (IdEstado)
END