IF OBJECT_ID('enderecos.sp_InsereLote') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereLote
END
GO

CREATE PROCEDURE enderecos.sp_InsereLote
    @IdLoteamento SMALLINT     = NULL
   ,@DescricaoLote VARCHAR(25) = NULL
   ,@Complemento VARCHAR(20)   = NULL
   ,@Inativo BIT               = NULL
   ,@LogIdUsuario SMALLINT     = NULL
   ,@IdLote SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Lotes (
       IdLoteamento
      ,DescricaoLote
      ,Complemento
      ,Inativo
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdLoteamento
      ,@DescricaoLote
      ,@Complemento
      ,@Inativo
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdLote = (SELECT @@IDENTITY)

   RETURN
END