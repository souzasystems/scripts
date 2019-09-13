IF OBJECT_ID('common.sp_ConsultaFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaFuncionario
END
GO

CREATE PROCEDURE common.sp_ConsultaFuncionario
   @IdFuncionario SMALLINT = NULL
AS
BEGIN
   SELECT IdFuncionario
         ,IdFuncaoFuncionario
         ,IdDescricaoHorario
         ,IdEstadoCivil
         ,NomeFuncionario
         ,DataAdmissao
         ,DataDemissao
         ,Sexo
         ,DataNascimento
         ,CPF
         ,Email
         ,Inativo
         ,NumeroCarteiraTrabalho
         ,NumeroPisPasep
         ,DigitoVerificadorPisPasep
         ,NumeroSerie
         ,DigitoVerificadorNumeroSerie
         ,IdEstadoEmissao
         ,DataEmissaoCarteiraTrabalho
         ,LocalEmissaoCarteiraTrabalho
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.Funcionarios WITH(NOLOCK)
   WHERE IdFuncionario = @IdFuncionario

   RETURN
END
GO