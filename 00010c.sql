IF OBJECT_ID('enderecos.sp_AlteraLogradouro') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraLogradouro
END
GO

CREATE PROCEDURE enderecos.sp_AlteraLogradouro
    @IdLogradouro SMALLINT             = NULL
   ,@DescricaoLogradouro VARCHAR(25)   = NULL
   ,@AbreviaturaLogradouro VARCHAR(10) = NULL
   ,@Inativo BIT                       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Logradouros
      SET DescricaoLogradouro   = @DescricaoLogradouro
         ,AbreviaturaLogradouro = @AbreviaturaLogradouro
         ,Inativo               = @Inativo
         ,LogIdUsuario          = @LogIdUsuario
         ,LogRotina             = 'A'
         ,LogDataHora           = (SELECT getDate())
   WHERE IdLogradouro = @IdLogradouro

   RETURN
END