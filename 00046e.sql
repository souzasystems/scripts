IF OBJECT_ID('academy.sp_ConsultaAtividadeFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaAtividadeFuncionario
END
GO

CREATE PROCEDURE academy.sp_ConsultaAtividadeFuncionario
   @IdAtividadeFuncionario INTEGER = NULL
AS
BEGIN
   SELECT IdAtividade
         ,IdFuncionario
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.AtividadesFuncionarios WITH(NOLOCK)
   WHERE IdAtividadeFuncionario = @IdAtividadeFuncionario

   RETURN
END