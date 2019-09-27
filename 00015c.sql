IF OBJECT_ID('enderecos.sp_AlteraCondominio') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraCondominio
END
GO

CREATE PROCEDURE enderecos.sp_AlteraCondominio
    @IdCondominio SMALLINT      = NULL
   ,@IdBairro INTEGER           = NULL
   ,@NomeCondominio VARCHAR(50) = NULL
   ,@Inativo BIT                = NULL
   ,@LogIdUsuario SMALLINT      = NULL

AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Condominios
      SET IdBairro       = @IdBairro
         ,NomeCondominio = @NomeCondominio
         ,Inativo        = @Inativo
         ,LogIdUsuario   = @LogIdUsuario
         ,LogRotina      = 'A'
         ,LogDataHora    = (SELECT getDate())
   WHERE IdCondominio = @IdCondominio

   RETURN
END