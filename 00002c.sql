IF OBJECT_ID('common.sp_AlteraTipoTelefone') IS NOT NULL
BEGIN
   DROP PROCEDURE common.sp_AlteraTipoTelefone
END
GO

CREATE PROCEDURE common.sp_AlteraTipoTelefone
    @IdTipoTelefone TINYINT            = NULL
   ,@DescricaoTipoTelefone VARCHAR(25) = NULL
   ,@MascaraTelefone VARCHAR(15)       = NULL
   ,@LogIdUsuario SMALLINT             = NULL
AS
BEGIN
   SET NOCOUNT ON
   SET XACT_ABORT ON

   UPDATE common.TiposTelefone
      SET DescricaoTipoTelefone = @DescricaoTipoTelefone
         ,MascaraTelefone       = @MascaraTelefone
         ,LogIdUsuario          = @LogIdUsuario
         ,LogRotina             = 'A'
         ,LogDataHora           = (SELECT getDate())
   WHERE IdTipoTelefone = @IdTipoTelefone

   RETURN
END
GO