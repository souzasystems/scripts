IF OBJECT_ID('enderecos.sp_InsereZona') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_InsereZona
END
GO

CREATE PROCEDURE enderecos.sp_InsereZona
    @IdTipoZona TINYINT                = NULL
   ,@DescricaoZona VARCHAR(50)         = NULL
   ,@Inativa BIT                       = NULL
   ,@AreaMinima DECIMAL(15, 03)        = NULL
   ,@TestadaMinima DECIMAL(15, 03)     = NULL
   ,@ComplementoAreaMinima VARCHAR(08) = NULL
   ,@IdentificadorZona VARCHAR(10)     = NULL
   ,@LogIdUsuario SMALLINT             = NULL
   ,@IdZona SMALLINT OUTPUT
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   INSERT INTO enderecos.Zonas (
       IdTipoZona
      ,DescricaoZona
      ,Inativa
      ,AreaMinima
      ,TestadaMinima
      ,ComplementoAreaMinima
      ,IdentificadorZona
      ,LogIdUsuario
      ,LogRotina
      ,LogDataHora
   )
   VALUES (
       @IdTipoZona
      ,@DescricaoZona
      ,@Inativa
      ,@AreaMinima
      ,@TestadaMinima
      ,@ComplementoAreaMinima
      ,@IdentificadorZona
      ,@LogIdUsuario
      ,'I'
      ,(SELECT getDate())
   )

   SET @IdZona = (SELECT @@IDENTITY)

   RETURN
END