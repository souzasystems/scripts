IF OBJECT_ID('enderecos.sp_InsereLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_InsereLogradouro
    @DescricaoLogradouro VARCHAR(25)   = NULL
   ,@AbreviaturaLogradouro VARCHAR(10) = NULL
   ,@Inativo BIT                       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdLogradouro SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   DECLARE @ErrorMessage VARCHAR(MAX) = ''
          ,@ErrorSeverity INTEGER     = 00
          ,@ErrorState INTEGER        = 00

   BEGIN TRY
      BEGIN TRANSACTION

         INSERT INTO enderecos.Logradouros (
             DescricaoLogradouro
            ,AbreviaturaLogradouro
            ,Inativo
            ,LogIdUsuario
            ,LogRotina
            ,LogDataHora
         )
         VALUES (
             @DescricaoLogradouro
            ,@AbreviaturaLogradouro
            ,@Inativo
            ,@LogIdUsuario
            ,'I'
            ,(SELECT getDate())
         )

      COMMIT

      SET @IdLogradouro = (SELECT @@IDENTITY)
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