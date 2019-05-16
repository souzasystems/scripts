IF OBJECT_ID('common.sp_InsereDescricaoHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereDescricaoHorario
END
GO

CREATE PROCEDURE common.sp_InsereDescricaoHorario
    @DescricaoHorario VARCHAR(50) = NULL
   ,@TipoHorario CHAR(01)         = NULL
   ,@LogIdUsuario SMALLINT        = NULL
   ,@IdDescricaoHorario TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO common.DescricoesHorarios (
             DescricaoHorario
            ,TipoHorario
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @DescricaoHorario
            ,@TipoHorario
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdDescricaoHorario = (SELECT @@IDENTITY)
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