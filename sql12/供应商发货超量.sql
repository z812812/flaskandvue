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
--材料出库单
alter TRIGGER rdrecords11_zy 
   ON  rdrecords11
   for insert
   
AS 
declare @time date
set @time=GETDATE()
exec OM_SP_GetCLYE N'TEMPDB..TMPUF_265336205_heron1125795190_ZY',@time,@time,N'',N' 1=1',N' 1=1',N' 1=1',N' 1=1'


declare @cvencode int --供应商编码
declare @num float --材料出库单的总数量
declare @benum float --规定的总数量
declare @crdcode int --收发类别 203 委外发料
declare @nownum float --现在的数量
set @cvencode=(select top 1 cvencode from inserted a inner join rdrecord11 b with(nolock) on a.id=b.ID)
set @num=(select SUM(iquantity) from inserted )
set @nownum=(select  sum(本期结余_数量) from TEMPDB..TMPUF_265336205_heron1125795190_ZY  where 供应商编码=@cvencode)
set @benum=(select iEmployeeNum from Vendor where cVenCode=@cvencode)
set @crdcode=(select top 1 b.cRdCode from inserted a inner join rdrecord11 b with(nolock) on a.id=b.ID)
--insert into temp_zy111 (a,b,c) values (@num,@nownum,@benum)
if 
@crdcode=203 and isnull(cast(@num as int),0)+isnull(cast(@nownum as int),0)>isnull(cast(@benum as  int ),0)
BEGIN
	
	RAISERROR('该供应商发货超量',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
