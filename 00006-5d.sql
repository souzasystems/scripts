IF OBJECT_ID('enderecos.sp_ExcluiTipoZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ExcluiTipoZona
END
GO

CREATE PROCEDURE enderecos.sp_ExcluiTipoZona
    @IdTipoZona TINYINT             = NULL
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
      SET @ErrorMessage = 'O motivo da exclusão do tipo de zona não foi informado.' + CHAR(13) + CHAR(10)
                        + 'Por favor, informe o motivo da exclusão para que o mesmo possa ser excluído.'

      RAISERROR (@ErrorMessage, 11, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.TiposZona
            SET LogIdUsuario      = @LogIdUsuario
               ,LogRotina         = 'E'
               ,LogDataHora       = (SELECT getDate())
               ,LogMotivoExclusao = @LogMotivoExclusao
         WHERE IdTipoZona = @IdTipoZona

         DELETE FROM enderecos.TiposZona
         WHERE IdTipoZona = @IdTipoZona

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