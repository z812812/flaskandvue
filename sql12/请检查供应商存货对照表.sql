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
CREATE TRIGGER pu_PriceJustDetail_jgkz 
   ON  pu_PriceJustDetail
   for insert
   
AS 
declare @crsl int
declare @crczsl int
set @crsl=(select COUNT(*) from inserted)
set @crczsl=(select COUNT(*) from inserted where cinvcode+cvencode in (select cInvCode+CVenCode from VenAndInv))
if 
@crsl<>@crczsl
BEGIN

	RAISERROR('请参照供应商存货对照表',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
