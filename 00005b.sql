IF OBJECT_ID('enderecos.sp_InsereEstado') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereEstado
END
GO

CREATE PROCEDURE enderecos.sp_InsereEstado
    @IdPais SMALLINT        = NULL
   ,@NomeEstado VARCHAR(20) = NULL
   ,@SiglaEstado CHAR(02)   = NULL
   ,@CodigoIBGE TINYINT     = NULL
   ,@Inativo BIT            = NULL
   ,@LogIdUsuario SMALLINT  = NULL
   ,@IdEstado SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Estados (
       IdPais
      ,NomeEstado
      ,SiglaEstado
      ,CodigoIBGE
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdPais
      ,@NomeEstado
      ,@SiglaEstado
      ,@CodigoIBGE
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdEstado = (SELECT @@IDENTITY)

   RETURN
END