IF OBJECT_ID('common.sp_ConsultaHorarios') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaHorarios
END
GO

CREATE PROCEDURE common.sp_ConsultaHorarios
   @IdDescricaoHorario TINYINT = NULL
AS
BEGIN
   SELECT IdHorario
         ,IdDescricaoHorario
         ,CONVERT(VARCHAR(05), HoraInicial, 108) AS HoraInicial
         ,CONVERT(VARCHAR(05), HoraFinal, 108) AS HoraFinal
         ,CASE
             WHEN DiaSemana = 00 THEN
                'DOMINGO'
             WHEN DiaSemana = 01 THEN
                'SEGUNDA-FEIRA'
             WHEN DiaSemana = 02 THEN
                'TERÇA-FEIRA'
             WHEN DiaSemana = 03 THEN
                'QUARTA-FEIRA'
             WHEN DiaSemana = 04 THEN
                'QUINTA-FEIRA'
             WHEN DiaSemana = 05 THEN
                'SEXTA-FEIRA'
             ELSE
                'SÁBADO'
          END AS DiaSemana
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.Horarios WITH(NOLOCK)
   WHERE IdDescricaoHorario = @IdDescricaoHorario
   ORDER BY IdHorario

   RETURN
END
GO