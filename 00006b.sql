IF OBJECT_ID('enderecos.sp_InsereCidade') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereCidade
END
GO

CREATE PROCEDURE enderecos.sp_InsereCidade
    @IdEstado SMALLINT      = NULL
   ,@NomeCidade VARCHAR(45) = NULL
   ,@CodigoIBGE INTEGER     = NULL
   ,@NumeroDDD TINYINT      = NULL
   ,@Inativa BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdCidade SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Cidades (
             IdEstado
            ,NomeCidade
            ,CodigoIBGE
            ,NumeroDDD
            ,Inativa
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @IdEstado
            ,@NomeCidade
            ,@CodigoIBGE
            ,@NumeroDDD
            ,@Inativa
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdCidade = (SELECT @@IDENTITY)
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