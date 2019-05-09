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
         VALUES (
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