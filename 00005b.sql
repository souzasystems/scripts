IF OBJECT_ID('enderecos.sp_InsereEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereEstado
END
GO

CREATE PROCEDURE enderecos.sp_InsereEstado
    @IdPais SMALLINT        = NULL
   ,@NomeEstado VARCHAR(20) = NULL
   ,@SiglaEstado CHAR(02)   = NULL
   ,@CodigoIBGE TINYINT     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdEstado SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Estados (
             IdPais
            ,NomeEstado
            ,SiglaEstado
            ,CodigoIBGE
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @IdPais
            ,@NomeEstado
            ,@SiglaEstado
            ,@CodigoIBGE
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdEstado = (SELECT @@IDENTITY)
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