IF OBJECT_ID('enderecos.sp_ConsultaVia') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaVia
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaVia
    @IdVia INTEGER   = NULL
   ,@Cep VARCHAR(08) = NULL
AS
BEGIN
   SELECT IdVia
         ,IdLogradouro
         ,IdBairro
         ,NomeVia
         ,Cep
         ,Inativa
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
   FROM enderecos.Vias WITH(NOLOCK)
   WHERE IdVia = @IdVia
      OR Cep   = @Cep

   RETURN
END