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
alter TRIGGER po_podetails_zy_wujiage 
   ON  po_podetails
   for insert
   
AS 

declare @new int
set @new=(select COUNT(*) from inserted where iUnitPrice=0 and (cInvCode not like '09%' and cInvCode not like '10%' and cInvCode not like '11%'))
--set @crsl=(select COUNT(*) from inserted)


if 
@new>0
BEGIN

	RAISERROR('除了锻坯，精坯，钢材，其他必须有价格',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
