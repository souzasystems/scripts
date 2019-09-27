IF OBJECT_ID('enderecos.sp_AlteraVia') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraVia
END
GO

CREATE PROCEDURE enderecos.sp_AlteraVia
    @IdVia INTEGER         = NULL
   ,@IdLogradouro SMALLINT = NULL
   ,@IdBairro INTEGER      = NULL
   ,@NomeVia VARCHAR(60)   = NULL
   ,@Cep CHAR(08)          = NULL
   ,@Inativa BIT           = NULL
   ,@LogIdUsuario SMALLINT = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Vias 
      SET IdLogradouro = @IdLogradouro
         ,IdBairro     = @IdBairro
         ,NomeVia      = @NomeVia
         ,Cep          = @Cep
         ,Inativa      = @Inativa
         ,LogIdUsuario = @LogIdUsuario
         ,LogRotina    = 'A'
         ,LogDataHora  = (SELECT getDate())
   WHERE IdVia = @IdVia

   RETURN
END