declare @a nvarchar(50)
declare @b nvarchar(50)
declare @c date
declare @d nvarchar(50)
declare @cPOID nvarchar(50),@POIDs nvarchar(50),@dArriveDate date,@cInvCode nvarchar(50),
@cInvName nvarchar(50),@cInvStd nvarchar(50),@cBusType nvarchar(50),@cVenCode nvarchar(50),@tips nvarchar(500)

--定义游标
declare cur_zy cursor optimistic for 
 select a,b,c from zyschangeorderdate where a is not null
 
 --drop table Sheet2$
open cur_zy
fetch next from cur_zy into @a,@b,@c
while @@FETCH_STATUS=0
begin
	-- 查询平台表，获取信息
	select @cPOID=a.cPOID,@POIDs=a.POIDs,@dArriveDate=a.dArriveDate,@cInvCode=a.cInvCode,@cInvName=a.cInvName,@cInvStd=a.cInvStd,@cBusType=b.cBusType,@cVenCode=b.cVenCode 
	from kskf..PO_Podetails a left join kskf..PO_Pomain b on a.POID=b.POID 
	where a.cPOID=@a  and irowno=@b
	--委外订单修改
	if @cbustype= '委外加工'
		begin
		--先改ERP
			update UFDATA_003_2016..OM_MODetails
			set dArriveDate=@c
			where MODetailsID=@POIDs
		--再改供应商平台
			update kskf..PO_Podetails
			set dArriveDate=@c
			where POIDs=@POIDs
		--然后更改消息
		set	@tips='存货代码：'+@cInvCode+'，存货名称：'+@cInvName+'，规格型号：'+@cInvStd+'，原到货日期：'+
					convert(nvarchar(50),@dArriveDate,23)+'，变更为：'+ convert(nvarchar(50),@c,23)
			INSERT INTO [kskf].[dbo].[Messagets]([Content],[SendPerson],[SendTime],[SendDate],[cVenCode],[cState],[cPOID],[title],[iBillType],[AutoId],[cBusType])
			VALUES(@tips,'钟源',GETDATE(),convert(varchar(50),GETDATE(),23),@cVenCode,0,@cPOID,'【计划到货日期变更】',0,0,@cBusType)
		end
	else
	--  更改采购订单
		begin
			--先改ERP
			update UFDATA_003_2016..po_podetails
			set dArriveDate=@c
			where ID=@POIDs
		--再改供应商平台
			update kskf..PO_Podetails
			set dArriveDate=@c
			where POIDs=@POIDs
		--然后更改消息
		set	@tips='存货代码：'+@cInvCode+'，存货名称：'+@cInvName+'，规格型号：'+@cInvStd+'，原到货日期：'+
					convert(nvarchar(50),@dArriveDate,23)+'，变更为：'+ convert(nvarchar(50),@c,23)
			INSERT INTO [kskf].[dbo].[Messagets]([Content],[SendPerson],[SendTime],[SendDate],[cVenCode],[cState],[cPOID],[title],[iBillType],[AutoId],[cBusType])
			VALUES(@tips,'钟源',GETDATE(),convert(varchar(50),GETDATE(),23),@cVenCode,0,@cPOID,'【计划到货日期变更】',0,0,@cBusType)
		end
	fetch next from cur_zy into @a,@b,@c

end
close cur_zy
deallocate cur_zy

