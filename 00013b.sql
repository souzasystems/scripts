IF OBJECT_ID('enderecos.sp_InsereLoteamento') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLoteamento
END
GO

CREATE PROCEDURE enderecos.sp_InsereLoteamento
    @IdQuadra SMALLINT               = NULL
   ,@DescricaoLoteamento VARCHAR(50) = NULL
   ,@Inativo BIT                     = NULL
   ,@LogIdUsuario SMALLINT           = NULL
   ,@IdLoteamento SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Loteamentos (
             IdQuadra
            ,DescricaoLoteamento
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @IdQuadra
            ,@DescricaoLoteamento
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdLoteamento = (SELECT @@IDENTITY)
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