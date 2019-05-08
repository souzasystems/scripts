IF OBJECT_ID('common.sp_InsereEstadoCivil') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereEstadoCivil
END
GO

CREATE PROCEDURE common.sp_InsereEstadoCivil
    @DescricaoEstadoCivil VARCHAR(25) = NULL
   ,@LogIdUsuario SMALLINT            = NULL
   ,@IdEstadoCivil TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@DescricaoEstadoCivil, '') = ''
   BEGIN
      SET @ErrorMessage = 'O nome do estado civil não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO common.EstadosCivis(
             DescricaoEstadoCivil
            ,LogIdUsuario
            ,LogRotina
            ,LogDataHora
         )
         VALUES(
             @DescricaoEstadoCivil
            ,@LogIdUsuario
            ,'I'
            ,(SELECT getDate())
         )

      COMMIT

      SET @IdEstadoCivil = (SELECT @@IDENTITY)
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