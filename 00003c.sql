IF OBJECT_ID('common.sp_AlteraEstadoCivil') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraEstadoCivil
END
GO

CREATE PROCEDURE common.sp_AlteraEstadoCivil
    @IdEstadoCivil TINYINT            = NULL
   ,@DescricaoEstadoCivil VARCHAR(25) = NULL
   ,@LogIdUsuario SMALLINT            = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.EstadosCivis
      SET DescricaoEstadoCivil = @DescricaoEstadoCivil
         ,LogIdUsuario         = @LogIdUsuario
         ,LogRotina            = 'A'
         ,LogDataHora          = (SELECT getDate())
   WHERE IdEstadoCivil = @IdEstadoCivil

   RETURN
END
GO