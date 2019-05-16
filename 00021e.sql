IF OBJECT_ID('common.sp_ConsultaHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaHorario
END
GO

CREATE PROCEDURE common.sp_ConsultaHorario
   @IdHorario SMALLINT = NULL
AS
BEGIN
   SELECT IdHorario
         ,IdDescricaoHorario
         ,HoraInicial
         ,HoraFinal
         ,DiaSemana
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.Horarios
   WHERE IdHorario = @IdHorario

   RETURN
END
GO