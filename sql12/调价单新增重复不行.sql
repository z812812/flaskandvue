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
create TRIGGER pu_PriceJustDetail_jgkz 
   ON  pu_PriceJustDetail
   for insert
   
AS 
declare @crsl int
declare @crczsl int
declare @new int
set @new=(select COUNT(*) from inserted where operationtype=0)
--set @crsl=(select COUNT(*) from inserted)
set @crczsl=(select COUNT(*) from inserted a  inner join PU_PriceJustMain b on a.id=b.id
                                              inner join Ven_Inv_Price c on a.cinvcode=c.cInvCode and a.cvencode=c.cVenCode and b.iSupplyType=c.iSupplyType
                                              where a.operationtype=0)
                                              
if 
@crczsl>0 and @new>0
BEGIN

	RAISERROR('新增价格在价格表里有记录，请参照价格表修改',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
