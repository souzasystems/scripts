IF NOT EXISTS(SELECT 01 FROM SYSCOLUMNS WHERE Id = OBJECT_ID('TiposTelefone') AND Name = 'MascaraTelefone')
   ALTER TABLE TiposTelefone ADD MascaraTelefone VARCHAR(15) NULL

UPDATE TiposTelefone SET MascaraTelefone = '#####-####'
WHERE IdTipoTelefone = 03

UPDATE TiposTelefone SET MascaraTelefone = '####-####'
WHERE IdTipoTelefone = 04