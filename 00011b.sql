IF OBJECT_ID('enderecos.sp_InsereQuadra') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereQuadra
END
GO

CREATE PROCEDURE enderecos.sp_InsereQuadra
    @IdBairro INTEGER            = NULL
   ,@DescricaoQuadra VARCHAR(35) = NULL
   ,@Complemento VARCHAR(05)     = NULL
   ,@Inativa BIT                 = NULL
   ,@LogIdUsuario SMALLINT       = NULL
   ,@IdQuadra SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Quadras (
       IdBairro
      ,DescricaoQuadra
      ,Complemento
      ,Inativa
      ,LogIdUsuario
      ,LogRotina
   )
   VALUES (
       @IdBairro
      ,@DescricaoQuadra
      ,@Complemento
      ,@Inativa
      ,@LogIdUsuario
      ,'I'
   )

   SET @IdQuadra = (SELECT @@IDENTITY)

   RETURN
END