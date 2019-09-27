IF OBJECT_ID('enderecos.sp_AlteraQuadra') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraQuadra
END
GO

CREATE PROCEDURE enderecos.sp_AlteraQuadra
    @IdQuadra SMALLINT           = NULL
   ,@IdBairro INTEGER            = NULL
   ,@DescricaoQuadra VARCHAR(35) = NULL
   ,@Complemento VARCHAR(05)     = NULL
   ,@Inativa BIT                 = NULL
   ,@LogIdUsuario SMALLINT       = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Quadras
      SET IdBairro        = @IdBairro
         ,DescricaoQuadra = @DescricaoQuadra
         ,Complemento     = @Complemento
         ,Inativa         = @Inativa
         ,LogIdUsuario    = @LogIdUsuario
         ,LogRotina       = 'A'
   WHERE IdQuadra = @IdQuadra

   RETURN
END