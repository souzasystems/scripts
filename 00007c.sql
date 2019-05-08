IF OBJECT_ID('enderecos.sp_AlteraZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraZona
END
GO

CREATE PROCEDURE enderecos.sp_AlteraZona
    @IdZona SMALLINT                   = NULL
   ,@IdTipoZona TINYINT                = NULL
   ,@DescricaoZona VARCHAR(50)         = NULL
   ,@Inativa BIT                       = NULL
   ,@AreaMinima DECIMAL(15, 03)        = NULL
   ,@TestadaMinima DECIMAL(15, 03)     = NULL
   ,@ComplementoAreaMinima VARCHAR(08) = NULL
   ,@IdentificadorZona VARCHAR(10)     = NULL
   ,@LogIdUsuario SMALLINT             = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   IF ISNULL(@IdentificadorZona, '') = ''
   BEGIN
      SET @ErrorMessage = 'O identificador da zona não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   IF ISNULL(@DescricaoZona, '') = ''
   BEGIN
      SET @ErrorMessage = 'A descrição da zona não pode ficar em branco.' + CHAR(13) + CHAR(10)
                        + 'Por favor, verifique!'

      RAISERROR (@ErrorMessage, 09, 01)
      RETURN
   END

   BEGIN TRY
      BEGIN TRANSACTION

         UPDATE enderecos.Zonas
            SET IdTipoZona            = @IdTipoZona
               ,DescricaoZona         = @DescricaoZona
               ,Inativa               = @Inativa
               ,AreaMinima            = @AreaMinima
               ,TestadaMinima         = @TestadaMinima
               ,ComplementoAreaMinima = @ComplementoAreaMinima
               ,IdentificadorZona     = @IdentificadorZona
               ,LogIdUsuario          = @LogIdUsuario
               ,LogRotina             = 'A'
               ,LogDataHora           = (SELECT getDate())
         WHERE IdZona = @IdZona

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