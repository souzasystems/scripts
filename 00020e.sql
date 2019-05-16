IF OBJECT_ID('common.sp_ConsultaDescricaoHorario') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaDescricaoHorario
END
GO

CREATE PROCEDURE common.sp_ConsultaDescricaoHorario
   @IdDescricaoHorario TINYINT = NULL
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
   WHERE IdDescricaoHorario = @IdDescricaoHorario

   RETURN
END
GO