-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter TRIGGER T_zy_rerecord01
   ON  rdrecord01
   for insert,update
   
AS 
declare @a varchar(20)
declare @b varchar(20)
set @a=(select dveridate=CONVERT(varchar(10),dVeriDate,120) from inserted)
set @b=(select dnmaketime=CONVERT(varchar(10),dnmaketime,120) from inserted)

if 
@a<>@b
BEGIN

	RAISERROR('制单日期和审核日期应该是同一天',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
