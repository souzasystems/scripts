IF OBJECT_ID('enderecos.sp_AlteraEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraEstado
END
GO

CREATE PROCEDURE enderecos.sp_AlteraEstado
    @IdEstado SMALLINT      = NULL
   ,@IdPais SMALLINT        = NULL
   ,@NomeEstado VARCHAR(20) = NULL
   ,@SiglaEstado CHAR(02)   = NULL
   ,@CodigoIBGE TINYINT     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Estados
            SET IdPais       = @IdPais
               ,NomeEstado   = @NomeEstado
               ,SiglaEstado  = @SiglaEstado
               ,CodigoIBGE   = @CodigoIBGE
               ,Inativo      = @Inativo
               ,LogIdUsuario = @LogIdUsuario
               ,LogRotina    = 'A'
               ,LogDataHora  = (SELECT getDate())
         WHERE IdEstado = @IdEstado

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