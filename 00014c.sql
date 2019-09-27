IF OBJECT_ID('enderecos.sp_AlteraLote') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraLote
END
GO

CREATE PROCEDURE enderecos.sp_AlteraLote
    @IdLote SMALLINT           = NULL
   ,@IdLoteamento SMALLINT     = NULL
   ,@DescricaoLote VARCHAR(25) = NULL
   ,@Complemento VARCHAR(20)   = NULL
   ,@Inativo BIT               = NULL
   ,@LogIdUsuario SMALLINT     = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Lotes
      SET IdLoteamento  = @IdLoteamento
         ,DescricaoLote = @DescricaoLote
         ,Complemento   = @Complemento
         ,Inativo       = @Inativo
         ,LogIdUsuario  = @LogIdUsuario
         ,LogRotina     = 'A'
         ,LogDataHora   = (SELECT getDate())
   WHERE IdLote = @IdLote

   RETURN
END