IF OBJECT_ID('enderecos.sp_ExcluiZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiZona
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiZona
    @IdZona SMALLINT                = NULL
   ,@LogIdUsuario SMALLINT          = NULL
   ,@LogMotivoExclusao VARCHAR(MAX) = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@LogMotivoExclusao, '') = ''
   BEGIN
      SET @ErrorMessage = 'O motivo da exclusão da zona não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, informe o motivo da exclusão para que a mesma possa ser excluído.'

      RAISERROR (@ErrorMessage, 11, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Zonas
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdZona = @IdZona

         DELETE FROM enderecos.Zonas
         WHERE IdZona = @IdZona

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