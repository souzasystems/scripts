IF OBJECT_ID('common.sp_ConsultaTelefonesFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaTelefonesFuncionario
END
GO

CREATE PROCEDURE common.sp_ConsultaTelefonesFuncionario
   @IdFuncionario SMALLINT = NULL
AS
BEGIN
   SELECT IdTelefoneFuncionario
         ,IdTipoTelefone
         ,DDDTelefone
         ,DDITelefone
         ,NumeroTelefone
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM vw_TelefonesFuncionario
   WHERE IdFuncionario = @IdFuncionario

   RETURN
END
GO