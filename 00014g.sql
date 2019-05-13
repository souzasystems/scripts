IF OBJECT_ID('enderecos.sp_ConsultaLotes') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaLotes
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaLotes
    @DescricaoLote VARCHAR(25) = NULL
   ,@Inativo SMALLINT          = NULL
AS
BEGIN
   SELECT IdLote
         ,IdLoteamento
         ,DescricaoLote
         ,Complemento
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,DescricaoLoteamento
   FROM vw_LotesLoteamentos 
   WHERE Inativo = @Inativo
     AND DescricaoLote LIKE @DescricaoLote

   RETURN
END