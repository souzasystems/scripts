IF OBJECT_ID('academy.sp_InsereTerminal') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_InsereTerminal
END
GO

CREATE PROCEDURE academy.sp_InsereTerminal
    @DescricaoTerminal VARCHAR(25) = NULL
   ,@Inativo BIT                   = NULL
   ,@LogIdUsuario SMALLINT         = NULL
   ,@IdTerminal TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO academy.Terminais (
             DescricaoTerminal
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @DescricaoTerminal
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdTerminal = (SELECT @@IDENTITY)
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