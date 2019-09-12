IF NOT EXISTS (SELECT 01 FROM sys.Indexes WHERE NAME = 'idx_NomeBairro')
BEGIN
   CREATE NONCLUSTERED INDEX idx_NomeBairro ON enderecos.Bairros (NomeBairro) INCLUDE (IdCidade)
END