IF OBJECT_ID('academy.sp_ConsultaTerminal') IS NOT NULL
BEGIN
   DROP PROCEDURE academy.sp_ConsultaTerminal
END
GO

CREATE PROCEDURE academy.sp_ConsultaTerminal
   @IdTerminal TINYINT = NULL
AS
BEGIN
   SELECT IdTerminal
         ,DescricaoTerminal
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM academy.Terminais
   WHERE IdTerminal = @IdTerminal

   RETURN
END