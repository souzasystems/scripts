IF OBJECT_ID('common.sp_ExluiDescricaoHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ExluiDescricaoHorario
END
GO

CREATE PROCEDURE common.sp_ExluiDescricaoHorario
    @IdDescricaoHorario TINYINT     = NULL
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

         UPDATE common.DescricoesHorarios
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdDescricaoHorario = @IdDescricaoHorario

         DELETE FROM common.DescricoesHorarios
         WHERE IdDescricaoHorario = @IdDescricaoHorario

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
GO