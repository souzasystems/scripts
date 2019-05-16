IF OBJECT_ID('enderecos.sp_ConsultaTipoEndereco') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaTipoEndereco
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaTipoEndereco
   @IdTipoEndereco TINYINT = NULL
AS
BEGIN
   SELECT IdTipoEndereco
         ,DescricaoTipoEndereco
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.TiposEndereco WITH(NOLOCK)
   WHERE IdTipoEndereco = @IdTipoEndereco
   ORDER BY IdTipoEndereco

   RETURN
END
GO