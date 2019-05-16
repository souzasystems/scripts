IF OBJECT_ID('enderecos.sp_ConsultaPaises') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaPaises
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaPaises
    @NomePais VARCHAR(50) = NULL
   ,@Inativo BIT          = NULL
AS
BEGIN
   SELECT IdPais
         ,NomePais
         ,Sigla02
         ,Sigla03
         ,CodigoIso3166
         ,NumeroDDI
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Paises WITH(NOLOCK)
   WHERE Inativo = @Inativo
     AND NomePais LIKE @NomePais

   RETURN
END