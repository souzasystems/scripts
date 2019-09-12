IF OBJECT_ID('enderecos.sp_ExcluiEnderecoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiEnderecoFuncionario
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiEnderecoFuncionario
    @IdEnderecoFuncionario INTEGER  = NULL
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

         UPDATE enderecos.EnderecosFuncionarios
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdEnderecoFuncionario = @IdEnderecoFuncionario

         DELETE FROM enderecos.EnderecosFuncionarios
         WHERE IdEnderecoFuncionario = @IdEnderecoFuncionario

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