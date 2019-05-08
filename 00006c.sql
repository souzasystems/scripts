IF OBJECT_ID('enderecos.sp_AlteraCidade') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraCidade
END
GO

CREATE PROCEDURE enderecos.sp_AlteraCidade
    @IdCidade SMALLINT      = NULL
   ,@IdEstado SMALLINT      = NULL
   ,@NomeCidade VARCHAR(45) = NULL
   ,@CodigoIBGE INTEGER     = NULL
   ,@NumeroDDD TINYINT      = NULL
   ,@Inativa BIT            = NULL
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

         UPDATE enderecos.Cidades
            SET IdEstado     = @IdEstado
               ,NomeCidade   = @NomeCidade
               ,CodigoIBGE   = @CodigoIBGE
               ,NumeroDDD    = @NumeroDDD
               ,Inativa      = @Inativa
               ,LogIdUsuario = @LogIdUsuario
               ,LogRotina    = 'A'
               ,LogDataHora  = (SELECT getDate())
         WHERE IdCidade = @IdCidade

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