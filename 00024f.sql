IF OBJECT_ID('common.sp_ConsultaFuncionarios') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaFuncionarios
END
GO

CREATE PROCEDURE common.sp_ConsultaFuncionarios
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

   RETURN
END
GO