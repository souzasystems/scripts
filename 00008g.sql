IF OBJECT_ID('enderecos.sp_ConsultaDistritos') IS NOT NULL
BEGIN
   DROP PROCEDURE enderecos.sp_ConsultaDistritos
END
GO

CREATE PROCEDURE enderecos.sp_ConsultaDistritos
    @Inativo BIT              = NULL
   ,@NomeDistrito VARCHAR(50) = NULL
AS
BEGIN
   SELECT IdDistrito
         ,IdCidade
         ,NomeDistrito
         ,Inativo
         ,LogIdUsuario
         ,LogRotina
         ,LogDataHora
         ,LogMotivoExclusao
         ,NomeCidade
   FROM vw_DistritosCidades
   WHERE Inativo = @Inativo
     AND NomeDistrito LIKE @NomeDistrito

   RETURN
END