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
alter TRIGGER transvouch_jzdb 
   ON  transvouch
   for insert
   
AS 
declare @dcck varchar(20)
declare @drck varchar(20)
declare @msg varchar(100)
set @dcck=(select cOWhCode from inserted)
set @drck=(select cIWhCode from inserted )
set @msg=@dcck+'库房不能向'+@drck+'库房调拨             '

if 
(@dcck='1101' and @drck='1103') or (@dcck='1301' and @drck='1302') or (@dcck='1305' and @drck='1303') or (@dcck='9957' and @drck='9959')
BEGIN

	RAISERROR(@msg,16,1)
	rollback

    -- Insert statements for trigger here

END
GO
