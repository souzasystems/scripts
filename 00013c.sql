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

   IF ISNULL(@IdQuadra, 00) = 00
   BEGIN
      SET @ErrorMessage = 'A quadra o qual o loteamento pertence não foi informada.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END
   
   IF ISNULL(@DescricaoLoteamento, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição do loteamento não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

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