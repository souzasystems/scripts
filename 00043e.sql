IF OBJECT_ID('academy.sp_ConsultaPlano') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaPlano
END
GO

CREATE PROCEDURE academy.sp_ConsultaPlano
   @IdPlano TINYINT = NULL
AS
BEGIN
   SELECT IdPlano
         ,NomePlano
         ,PermiteDesconto
         ,NumeroDiasBloqueio
         ,NumeroDiasInativacao
         ,NumeroDiasCorrido
         ,ConsideraSabado
         ,ConsideraDomingo
         ,ConsideraFeriados
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.Planos
   WHERE IdPlano = @IdPlano

   RETURN
END