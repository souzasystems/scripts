IF OBJECT_ID('enderecos.sp_InsereTipoZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereTipoZona
END
GO

CREATE PROCEDURE enderecos.sp_InsereTipoZona
    @DescricaoTipoZona VARCHAR(25) = NULL
   ,@LogIdUsuario SMALLINT         = NULL
   ,@IdTipoZona TINYINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.TiposZona (
       DescricaoTipoZona
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @DescricaoTipoZona
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdTipoZona = (SELECT @@IDENTITY)

   RETURN
END
GO