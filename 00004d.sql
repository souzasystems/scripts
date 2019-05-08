IF OBJECT_ID('enderecos.sp_ExcluiPais') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiPais
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiPais
    @IdPais SMALLINT                = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

      UPDATE enderecos.Paises
         SET LogIdUsuario      = @LogIdUsuario
            ,LogRotina         = 'E'
            ,LogDataHora       = (SELECT getDate())
            ,LogMotivoExclusao = @LogMotivoExclusao
      WHERE IdPais = @IdPais

      DELETE FROM enderecos.Paises
      WHERE IdPais = @IdPais

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