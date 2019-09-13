IF OBJECT_ID('common.sp_ConsultaTelefoneFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaTelefoneFuncionario
END
GO

CREATE PROCEDURE common.sp_ConsultaTelefoneFuncionario
   @IdTelefoneFuncionario SMALLINT = NULL
AS
BEGIN
   SELECT IdFuncionario
         ,IdTipoTelefone
         ,DDDTelefone
         ,DDITelefone
         ,NumeroTelefone
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.TelefonesFuncionarios WITH(NOLOCK)
   WHERE IdTelefoneFuncionario = @IdTelefoneFuncionario

   RETURN
END
GO