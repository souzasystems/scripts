IF OBJECT_ID('enderecos.sp_InsereLote') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLote
END
GO

CREATE PROCEDURE enderecos.sp_InsereLote
    @IdLoteamento SMALLINT     = NULL
   ,@DescricaoLote VARCHAR(25) = NULL
   ,@Complemento VARCHAR(20)   = NULL
   ,@Inativo BIT               = NULL
   ,@LogIdUsuario SMALLINT     = NULL
   ,@IdLote SMALLINT OUTPUT
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

         INSERT INTO enderecos.Lotes (
             IdLoteamento
            ,DescricaoLote
            ,Complemento
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES(
             @IdLoteamento
            ,@DescricaoLote
            ,@Complemento
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdLote = (SELECT @@IDENTITY)
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