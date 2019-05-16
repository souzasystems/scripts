IF OBJECT_ID('common.sp_ConsultaDescricoesHorarios') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaDescricoesHorarios
END
GO

CREATE PROCEDURE common.sp_ConsultaDescricoesHorarios
AS
BEGIN
   SELECT IdDescricaoHorario
         ,DescricaoHorario
         ,TipoHorario
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.DescricoesHorarios
   ORDER BY IdDescricaoHorario

   RETURN
END
GO