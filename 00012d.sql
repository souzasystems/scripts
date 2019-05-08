IF OBJECT_ID('enderecos.sp_ExcluiVia') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiVia
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiVia
    @IdVia INTEGER                  = NULL
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
      SET @ErrorMessage = 'O motivo da exclusão da via não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, informe o motivo da exclusão para que a mesma possa ser excluída.'

      RAISERROR (@ErrorMessage, 11, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Vias 
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdVia = @IdVia

         DELETE FROM enderecos.Vias
         WHERE IdVia = @IdVia

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