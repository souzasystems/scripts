IF OBJECT_ID('enderecos.sp_ConsultaQuadra') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaQuadra
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaQuadra
   @IdQuadra SMALLINT = NULL
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
   FROM enderecos.Quadras WITH(NOLOCK)
   WHERE IdQuadra = @IdQuadra

   RETURN
END