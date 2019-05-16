IF OBJECT_ID('common.sp_AlteraDescricaoHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraDescricaoHorario
END
GO

CREATE PROCEDURE common.sp_AlteraDescricaoHorario
    @IdDescricaoHorario TINYINT   = NULL
   ,@DescricaoHorario VARCHAR(50) = NULL
   ,@TipoHorario CHAR(01)         = NULL
   ,@LogIdUsuario SMALLINT        = NULL
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
            SET DescricaoHorario = @DescricaoHorario
               ,TipoHorario      = @TipoHorario
               ,LogIdUsuario     = @LogIdUsuario
               ,LogRotina        = 'A'
               ,LogDataHora      = (SELECT getDate())
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