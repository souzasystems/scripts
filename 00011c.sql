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

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Quadras
            SET IdBairro        = @IdBairro
               ,DescricaoQuadra = @DescricaoQuadra
               ,Complemento     = @Complemento
               ,Inativa         = @Inativa
               ,LogIdUsuario    = @LogIdUsuario
               ,LogRotina       = 'A'
         WHERE IdQuadra = @IdQuadra

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