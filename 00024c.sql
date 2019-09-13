IF OBJECT_ID('common.sp_AlteraFuncionario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraFuncionario
END
GO

CREATE PROCEDURE common.sp_AlteraFuncionario
    @IdFuncionario SMALLINT                   = NULL
   ,@IdFuncaoFuncionario TINYINT              = NULL
   ,@IdDescricaoHorario TINYINT               = NULL
   ,@IdEstadoCivil TINYINT                    = NULL
   ,@NomeFuncionario VARCHAR(100)             = NULL
   ,@DataAdmissao DATE                        = NULL
   ,@DataDemissao DATE                        = NULL
   ,@Sexo CHAR(01)                            = NULL
   ,@DataNascimento DATE                      = NULL
   ,@CPF CHAR(11)                             = NULL
   ,@Email VARCHAR(80)                        = NULL
   ,@Inativo BIT                              = NULL
   ,@NumeroCarteiraTrabalho VARCHAR(15)       = NULL
   ,@NumeroPisPasep VARCHAR(15)               = NULL
   ,@DigitoVerificadorPisPasep VARCHAR(03)    = NULL
   ,@NumeroSerie VARCHAR(05)                  = NULL
   ,@DigitoVerificadorNumeroSerie VARCHAR(03) = NULL
   ,@IdEstadoEmissao SMALLINT                 = NULL
   ,@DataEmissaoCarteiraTrabalho DATE         = NULL
   ,@LocalEmissaoCarteiraTrabalho VARCHAR(20) = NULL
   ,@LogIdUsuario SMALLINT                    = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.Funcionarios
      SET IdFuncaoFuncionario          = @IdFuncaoFuncionario
         ,IdDescricaoHorario           = @IdDescricaoHorario
         ,IdEstadoCivil                = @IdEstadoCivil
         ,NomeFuncionario              = @NomeFuncionario
         ,DataAdmissao                 = @DataAdmissao
         ,DataDemissao                 = @DataDemissao
         ,Sexo                         = @Sexo
         ,DataNascimento               = @DataNascimento
         ,CPF                          = @CPF
         ,Email                        = @Email
         ,Inativo                      = @Inativo
         ,NumeroCarteiraTrabalho       = @NumeroCarteiraTrabalho
         ,NumeroPisPasep               = @NumeroPisPasep
         ,DigitoVerificadorPisPasep    = @DigitoVerificadorPisPasep
         ,NumeroSerie                  = @NumeroSerie
         ,DigitoVerificadorNumeroSerie = @DigitoVerificadorNumeroSerie
         ,IdEstadoEmissao              = @IdEstadoEmissao
         ,DataEmissaoCarteiraTrabalho  = @DataEmissaoCarteiraTrabalho
         ,LocalEmissaoCarteiraTrabalho = @LocalEmissaoCarteiraTrabalho
         ,LogIdUsuario                 = @LogIdUsuario
         ,LogRotina                    = 'A'
         ,LogDataHora                  = (SELECT getDate())
   WHERE IdFuncionario = @IdFuncionario

   RETURN
END
GO