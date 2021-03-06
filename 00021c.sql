IF OBJECT_ID('common.sp_AlteraHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraHorario
END
GO

CREATE PROCEDURE common.sp_AlteraHorario
   @IdHorario SMALLINT         = NULL
  ,@IdDescricaoHorario TINYINT = NULL
  ,@HoraInicial TIME           = NULL
  ,@HoraFinal TIME             = NULL
  ,@DiaSemana TINYINT          = NULL
  ,@LogIdUsuario SMALLINT      = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE common.Horarios
            SET IdDescricaoHorario = @IdDescricaoHorario
               ,HoraInicial        = @HoraInicial
               ,HoraFinal          = @HoraFinal
               ,DiaSemana          = @DiaSemana
               ,LogIdUsuario       = @LogIdUsuario
               ,LogRotina          = 'A'
               ,LogDataHora        = (SELECT getDate())
         WHERE IdHorario = @IdHorario

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