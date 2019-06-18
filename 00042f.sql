IF OBJECT_ID('academy.sp_ConsultaTerminais') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaTerminais
END
GO

CREATE PROCEDURE academy.sp_ConsultaTerminais
AS
BEGIN
   SELECT IdTerminal
         ,DescricaoTerminal
         ,CASE
             WHEN ISNULL(Inativo, 00) = 01 THEN
                'SIM'
             ELSE
                'NÃO'
          END AS Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.Terminais
   ORDER BY IdTerminal

   RETURN
END