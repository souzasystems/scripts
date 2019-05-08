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

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@IdLoteamento, 00) = 00
   BEGIN
      SET @ErrorMessage = 'O loteamento o qual o lote pertence não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@DescricaoLote, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição do lote não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Lotes
            SET IdLoteamento  = @IdLoteamento
               ,DescricaoLote = @DescricaoLote
               ,Complemento   = @Complemento
               ,Inativo       = @Inativo
               ,LogIdUsuario  = @LogIdUsuario
               ,LogRotina     = 'A'
               ,LogDataHora   = (SELECT getDate())
         WHERE IdLote = @IdLote

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