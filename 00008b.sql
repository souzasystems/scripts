IF OBJECT_ID('enderecos.sp_InsereDistrito') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereDistrito
END
GO

CREATE PROCEDURE enderecos.sp_InsereDistrito
    @IdCidade SMALLINT        = NULL
   ,@NomeDistrito VARCHAR(50) = NULL
   ,@Inativo BIT              = NULL
   ,@LogIdUsuario SMALLINT    = NULL
   ,@IdDistrito SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Distritos (
             IdCidade
            ,NomeDistrito
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
            ,LogDataHora
         )
         VALUES (
             @IdCidade
            ,@NomeDistrito
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
            ,(SELECT getDate())
         )

      COMMIT

      SET @IdDistrito = (SELECT @@IDENTITY)
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