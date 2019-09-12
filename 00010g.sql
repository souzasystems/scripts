IF NOT EXISTS (SELECT 01 FROM sys.Indexes WHERE NAME = 'idx_DescricaoLogradouro')
BEGIN
   CREATE NONCLUSTERED INDEX idx_DescricaoLogradouro ON enderecos.Logradouros (DescricaoLogradouro)
END