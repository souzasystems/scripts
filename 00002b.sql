IF OBJECT_ID('common.sp_InsereTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_InsereTipoTelefone
END
GO

CREATE PROCEDURE common.sp_InsereTipoTelefone
    @DescricaoTipoTelefone VARCHAR(25) = NULL
   ,@MascaraTelefone VARCHAR(15)       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdTipoTelefone TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO common.TiposTelefone (
       DescricaoTipoTelefone
      ,MascaraTelefone
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @DescricaoTipoTelefone
      ,@MascaraTelefone
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdTipoTelefone = (SELECT @@IDENTITY)

   RETURN
END
GO