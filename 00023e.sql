IF OBJECT_ID('common.sp_ConsultaFuncaoFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaFuncaoFuncionario
END
GO

CREATE PROCEDURE common.sp_ConsultaFuncaoFuncionario
   @IdFuncaoFuncionario TINYINT = NULL
AS
BEGIN
   SELECT IdFuncaoFuncionario
         ,DescricaoFuncaoFuncionario
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.FuncoesFuncionario
   WHERE IdFuncaoFuncionario = @IdFuncaoFuncionario

   RETURN
END