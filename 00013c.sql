IF OBJECT_ID('enderecos.sp_AlteraLoteamento') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraLoteamento
END
GO

CREATE PROCEDURE enderecos.sp_AlteraLoteamento
    @IdLoteamento SMALLINT           = NULL
   ,@IdQuadra SMALLINT               = NULL
   ,@DescricaoLoteamento VARCHAR(50) = NULL
   ,@Inativo BIT                     = NULL
   ,@LogIdUsuario SMALLINT           = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Loteamentos
            SET IdQuadra            = @IdQuadra
               ,DescricaoLoteamento = @DescricaoLoteamento
               ,Inativo             = @Inativo
               ,LogIdUsuario        = @LogIdUsuario
               ,LogRotina           = 'A'
               ,LogDataHora         = (SELECT getDate())
         WHERE IdLoteamento = @IdLoteamento

      COMMIT
   END TRY
   BEGIN CATCH
      SELECT @ErrorMessage  = ERROR_MESSAGE()
            ,@ErrorSeverity = ERROR_SEVERITY()
            ,@ErrorState    = ERROR_STATE()

      RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
      ROLLBACK
   END CATCH

   RETURN
END