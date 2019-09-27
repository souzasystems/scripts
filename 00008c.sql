IF OBJECT_ID('enderecos.sp_AlteraDistrito') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_AlteraDistrito
END
GO

CREATE PROCEDURE enderecos.sp_AlteraDistrito
    @IdDistrito SMALLINT      = NULL
   ,@IdCidade SMALLINT        = NULL
   ,@NomeDistrito VARCHAR(50) = NULL
   ,@Inativo BIT              = NULL
   ,@LogIdUsuario SMALLINT    = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE enderecos.Distritos
      SET IdCidade     = @IdCidade
         ,NomeDistrito = @NomeDistrito
         ,Inativo      = @Inativo
         ,LogIdUsuario = @LogIdUsuario
         ,LogRotina    = 'A'
         ,LogDataHora  = (SELECT getDate())
   WHERE IdDistrito = @IdDistrito

   RETURN
END