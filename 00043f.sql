IF OBJECT_ID('academy.sp_ConsultaPlanos') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaPlanos
END
GO

CREATE PROCEDURE academy.sp_ConsultaPlanos
AS
BEGIN
   SELECT IdPlano
         ,NomePlano
         ,NumeroDiasBloqueio
         ,NumeroDiasInativacao
         ,NumeroDiasCorrido
         ,CASE WHEN PermiteDesconto = 01 THEN
             'SIM'
          ELSE
             'NÃO'
          END AS PermiteDesconto
         ,CASE WHEN ConsideraSabado = 01 THEN
             'SIM'
          ELSE
             'NÃO'
          END AS ConsideraSabado
         ,CASE WHEN ConsideraDomingo = 01 THEN
             'SIM'
          ELSE
             'NÃO'
          END AS ConsideraDomingo
         ,CASE WHEN ConsideraFeriados = 01 THEN
             'SIM'
          ELSE
             'NÃO'
          END AS ConsideraFeriados
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.Planos
   ORDER BY IdPlano

   RETURN
END