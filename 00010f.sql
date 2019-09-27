IF OBJECT_ID('enderecos.sp_ConsultaLogradouros') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaLogradouros
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaLogradouros
AS
BEGIN
   SELECT IdLogradouro
         ,DescricaoLogradouro
         ,AbreviaturaLogradouro
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Logradouros WITH(NOLOCK)
   ORDER BY IdLogradouro

   RETURN
END