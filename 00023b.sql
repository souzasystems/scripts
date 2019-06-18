IF OBJECT_ID('common.sp_InsereFuncaoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereFuncaoFuncionario
END
GO

CREATE PROCEDURE common.sp_InsereFuncaoFuncionario
    @DescricaoFuncaoFuncionario VARCHAR(60) = NULL
   ,@LogIdUsuario SMALLINT                  = NULL
   ,@IdFuncaoFuncionario TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO common.FuncoesFuncionario (
             DescricaoFuncaoFuncionario
            ,LogIdUsuario
            ,LogRotina
         )
         VALUES (
             @DescricaoFuncaoFuncionario
            ,@LogIdUsuario
            ,'I'
         )

      COMMIT

      SET @IdFuncaoFuncionario = (SELECT @@IDENTITY)
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