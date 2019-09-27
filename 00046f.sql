IF OBJECT_ID('academy.sp_ConsultaAtividadeFuncionarios') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaAtividadeFuncionarios
END
GO

CREATE PROCEDURE academy.sp_ConsultaAtividadeFuncionarios
   @IdAtividade SMALLINT = NULL
AS
BEGIN
   SELECT IdAtividadeFuncionario
         ,IdFuncionario
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.AtividadesFuncionarios WITH(NOLOCK)
   WHERE IdAtividade = @IdAtividade

   RETURN
END 