USE [UFDATA_009_2016]
GO
/****** Object:  Trigger [dbo].[po_podetails_zy_wujiage]    Script Date: 04/01/2019 10:13:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER TRIGGER [dbo].[po_podetails_zy_wujiage] 
   ON  [dbo].[PO_Podetails]
   for insert,update
   
AS 

declare @cinvcode varchar(20)
declare @error_cinv varchar(30)
--set @new=(select COUNT(*) from inserted where iUnitPrice=0 and (cInvCode not like '09%' and cInvCode not like '10%' and cInvCode not like '11%' and cInvCode not like '14%' and cInvCode not like '15%'))
--set @crsl=(select COUNT(*) from inserted)
declare @count int
declare @type int
set @type = (select top 1 cDefine15 from inserted a inner join po_pomain b on a.POID=b.POID)
set @cinvcode = (select top 1 cInvCode from inserted)
set @count = (select COUNT(*) from VenAndInv where cInvCode=@cinvcode)
set @error_cinv=@cinvcode+'有'+convert(varchar(10),@count)+'家供应商需走审批流'


if 
@count>1 and @type=0
BEGIN

	RAISERROR(@error_cinv,16,1)
	rollback

    -- Insert statements for trigger here

END
