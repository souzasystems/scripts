IF OBJECT_ID('common.sp_InsereHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereHorario
END
GO

CREATE PROCEDURE common.sp_InsereHorario
   @IdDescricaoHorario TINYINT = NULL
  ,@HoraInicial TIME           = NULL
  ,@HoraFinal TIME             = NULL
  ,@DiaSemana TINYINT          = NULL
  ,@LogIdUsuario SMALLINT      = NULL
  ,@IdHorario SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO common.Horarios (
             IdDescricaoHorario
            ,HoraInicial
            ,HoraFinal
            ,DiaSemana
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @IdDescricaoHorario
            ,@HoraInicial
            ,@HoraFinal
            ,@DiaSemana
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdHorario = (SELECT @@IDENTITY)
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