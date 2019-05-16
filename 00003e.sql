IF OBJECT_ID('common.sp_ConsultaEstadoCivil') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_ConsultaEstadoCivil
END
GO

CREATE PROCEDURE common.sp_ConsultaEstadoCivil
   @IdEstadoCivil TINYINT = NULL
AS
BEGIN
   SELECT IdEstadoCivil
         ,DescricaoEstadoCivil
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM common.EstadosCivis WITH(NOLOCK)
   WHERE IdEstadoCivil = @IdEstadoCivil

   RETURN
END
GO