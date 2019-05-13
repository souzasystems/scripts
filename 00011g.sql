IF OBJECT_ID('enderecos.sp_ConsultaQuadras') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaQuadras
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaQuadras
    @DescricaoQuadra VARCHAR(35) = NULL
   ,@Inativa BIT                 = NULL
AS
BEGIN
   SELECT IdQuadra
         ,IdBairro
         ,DescricaoQuadra
         ,Complemento
         ,Inativa
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,NomeBairro
   FROM vw_QuadrasBairros
   WHERE Inativa = @Inativa
     AND DescricaoQuadra LIKE @DescricaoQuadra

   RETURN
END