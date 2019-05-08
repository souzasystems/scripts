IF OBJECT_ID('enderecos.sp_ConsultaPais') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaPais
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaPais
   @IdPais SMALLINT = NULL
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
   FROM enderecos.Paises
   WHERE IdPais = @IdPais

   RETURN
END