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

   SET @IdDistrito = (SELECT @@IDENTITY)

   RETURN
END