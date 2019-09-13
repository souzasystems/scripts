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

   INSERT INTO common.EstadosCivis (
       DescricaoEstadoCivil
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @DescricaoEstadoCivil
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdEstadoCivil = (SELECT @@IDENTITY)

   RETURN
END
GO