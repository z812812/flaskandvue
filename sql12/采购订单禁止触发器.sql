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
alter TRIGGER nobuy_zyww
   ON  OM_MOMain
   for insert
   
AS 
declare @a int
set @a=(select b.bVenService from inserted a inner join Vendor b on a.cVenCode=b.cVenCode)

if 
@a=1
BEGIN

	RAISERROR('该供应商暂时停止采购',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
