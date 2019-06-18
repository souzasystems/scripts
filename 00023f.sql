IF OBJECT_ID('common.sp_ConsultaFuncoesFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaFuncoesFuncionario
END
GO

CREATE PROCEDURE common.sp_ConsultaFuncoesFuncionario
AS
BEGIN
   SELECT IdFuncaoFuncionario
         ,DescricaoFuncaoFuncionario
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.FuncoesFuncionario
   ORDER BY IdFuncaoFuncionario

   RETURN
END