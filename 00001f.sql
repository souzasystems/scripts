IF OBJECT_ID('enderecos.sp_ConsultaTiposEndereco') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaTiposEndereco
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaTiposEndereco
AS
BEGIN
   SELECT IdTipoEndereco
         ,DescricaoTipoEndereco
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.TiposEndereco
   ORDER BY IdTipoEndereco

   RETURN
END
GO