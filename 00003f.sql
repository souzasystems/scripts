IF OBJECT_ID('common.sp_ConsultaEstadosCivis') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaEstadosCivis
END
GO

CREATE PROCEDURE common.sp_ConsultaEstadosCivis
AS
BEGIN
   SELECT IdEstadoCivil
         ,DescricaoEstadoCivil
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.EstadosCivis
   ORDER BY IdEstadoCivil

   RETURN
END
GO