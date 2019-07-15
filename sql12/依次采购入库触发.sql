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
alter TRIGGER T_rdrecords01_yiciruku
   ON  rdrecords01
   for insert
   
AS 

declare @cinvcode nvarchar(50)

declare @vendorname nvarchar(50)
declare @poid nvarchar(50)
declare @omid nvarchar(50)
declare @poidforinserted nvarchar(50)
declare @omidforinserted nvarchar(50)

--定义游标
declare cur_zy cursor optimistic for 
 select  cinvcode,chVencode,isnull(min(iPOsID),0) as poid,isnull(min(iOMoDID),0) as omid from inserted  group by cinvcode,chvencode

open cur_zy
fetch next from cur_zy into @cinvcode,@vendorname,@poid,@omid
--v_cgwwc视图是所有还未入库的采购订单表体的 ID，存货编码，厂家 共3列
--v_wwwwc视图是所有还未入库的委外订单表体的 ID，存货编码，厂家 共3列
print @cinvcode+' '+@vendorname+'   '+@poid+'  '+@omid

set @poidforinserted=isnull((select top 1 id from v_cgwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
set @omidforinserted=isnull((select top 1 modetailsid from v_wwwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
while @@FETCH_STATUS=0
begin
--如果是根据采购订单入库则查看入库的采购订单表体行是不是所有采购订单未入库表体行的最小ID，是则什么都不做，不是就抛出异常并回滚。
--如果是委外订单入库则查询委外视图。
   if (@poid<>0 and @poid<>@poidforinserted)
         begin
			 print @poidforinserted+'  '+@poid
             RAISERROR('请选择最早的采购订单入库',16,1)
	         rollback
	     end
   /*if (@omid<>0 and @omid<>@omidforinserted)
        begin
             RAISERROR('请选择最早的委外订单入库',16,1)
	         rollback  
         end
    */
         
fetch next from cur_zy into @cinvcode,@vendorname,@poid,@omid
set @poidforinserted=isnull((select top 1 id from v_cgwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
set @omidforinserted=isnull((select top 1 modetailsid from v_wwwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
end

close cur_zy
deallocate cur_zy



/*
if 
@a=1
BEGIN

	RAISERROR('该供应商暂时停止采购',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
*/