IF OBJECT_ID('enderecos.sp_AlteraPais') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraPais
END
GO

CREATE PROCEDURE enderecos.sp_AlteraPais
    @IdPais SMALLINT        = NULL
   ,@NomePais VARCHAR(50)   = NULL
   ,@Sigla02 CHAR(02)       = NULL
   ,@Sigla03 CHAR(03)       = NULL
   ,@CodigoIso3166 SMALLINT = NULL
   ,@NumeroDDI SMALLINT     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

      UPDATE enderecos.Paises
         SET NomePais      = @NomePais
            ,Sigla02       = @Sigla02
            ,Sigla03       = @Sigla03
            ,CodigoIso3166 = @CodigoIso3166
            ,NumeroDDI     = @NumeroDDI
            ,Inativo       = @Inativo
            ,LogIdUsuario  = @LogIdUsuario
            ,LogRotina     = 'A'
            ,LogDataHora   = (SELECT getDate())
      WHERE IdPais = @IdPais

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