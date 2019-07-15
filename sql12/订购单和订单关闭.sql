


declare @ccode varchar(50),@row varchar(10),@puid varchar(50),@puautoid varchar(50),@id varchar(50),@poid varchar(50)

declare @cinvcode nvarchar(50)
declare @b nvarchar(50)
declare @c nvarchar(50)
declare @d nvarchar(50)

--定义游标
declare cur_zy cursor optimistic for 
 select a,b from Sheet2$
 --drop table Sheet2$
open cur_zy
fetch next from cur_zy into @cinvcode,@b
while @@FETCH_STATUS=0
begin
set @ccode=@cinvcode
set @row=@b

select @puautoid=a.AutoID,@puid=b.ID,@poid=d.POID,@id=c.ID
from PU_AppVouchs a 
inner join PU_AppVouch b on a.ID=b.ID 
left join po_podetails c on a.AutoID=c.iAppIds
left join po_pomain d on c.POID=d.POID				
where b.cCode=@ccode and a.ivouchrowno=@row
--关闭请购单

Update Pu_Appvouchs 
Set cbcloser=N'王玉国', dbcloseTime = GetDate(),dbcloseDate = N'2019-07-03' 
where autoID=@puautoid and isnull(cbcloser,'')=''

Update PU_AppVouch 
Set cCloser=N'王玉国',dCloseTime = GetDate(),dCloseDate = N'2019-07-03' 
where ID=@puid and not exists(select id from Pu_Appvouchs where isnull(cbcloser,'')='' and id=@puid)

--关闭采购订单
Update PO_POdetails 
Set cbcloser=N'王玉国', cbcloseTime = GetDate(),cbcloseDate = N'2019-07-03' 
where ID=@id and isnull(cbcloser,'')=''

Update PO_POMain 
Set cCloser=N'王玉国',dcloseTime = GetDate(),dcloseDate = N'2019-07-03' 
where POID=@poid and not exists(select id from po_podetails where isnull(cbcloser,'')='' and poid=@poid)

Update PO_POMain 
Set cState=2 
where POID=@poid and exists(select id from po_podetails where isnull(cbcloser,'')<>'' and poid=@poid)

fetch next from cur_zy into @cinvcode,@b

end
close cur_zy
deallocate cur_zy