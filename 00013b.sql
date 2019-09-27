IF OBJECT_ID('enderecos.sp_InsereLoteamento') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLoteamento
END
GO

CREATE PROCEDURE enderecos.sp_InsereLoteamento
    @IdQuadra SMALLINT               = NULL
   ,@DescricaoLoteamento VARCHAR(50) = NULL
   ,@Inativo BIT                     = NULL
   ,@LogIdUsuario SMALLINT           = NULL
   ,@IdLoteamento SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Loteamentos (
       IdQuadra
      ,DescricaoLoteamento
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdQuadra
      ,@DescricaoLoteamento
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdLoteamento = (SELECT @@IDENTITY)

   RETURN
END