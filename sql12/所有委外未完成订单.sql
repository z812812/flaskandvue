alter proc proc_zyswwqk 
--@cvencode nvarchar(10)
as 
set nocount on
delete from wwqk
/*create table wwqk
(
 [cCode][nvarchar](50) null,
 [MODetailsID][nvarchar](50) null,
 [cInvCode][nvarchar](50) null,
 [cInvAddCode][nvarchar](50) null,
 [cInvName][nvarchar](50) null,
 [cInvStd][nvarchar](50) null,
 [iquantity][nvarchar](50) null,
 [cVenCode][nvarchar](50) null,
 [cVenAbbName][nvarchar](50) null,
 [dStartDate][datetime] null,
 [dArriveDate][datetime] null,
 [notOutIquantity][nvarchar](50) null,
 [outIquantity][nvarchar](50) null,
 [notInIquantity][nvarchar](50) null,
 [inIquantity][nvarchar](50) null,
 [cInvCode1][nvarchar](50) null,
 [cInvAddCode1][nvarchar](50) null,
 [cInvName1][nvarchar](50) null,
 [cInvStd1][nvarchar](50) null,
 cVenState int null,
 cgState int null,
 otherState int null
)
*/
begin
insert into wwqk (cCode,MODetailsID,cInvCode,cInvAddCode,cInvName,cInvStd,iquantity,cVenCode,cVenAbbName,
dStartDate,dArriveDate,notOutIquantity,OutIquantity,notInIquantity,inIquantity,cVenState,cgState,otherState,cInvCode1,cInvAddCode1,cInvName1,cInvStd1) 
select a.cCode,a.MODetailsID,a.cInvCode,a.cInvAddCode,a.cInvName,a.cInvStd,a.iQuantity,
a.cVenCode,a.cVenAbbName,a.dStartDate,a.dArriveDate,
a.notOutIquantity,a.outIquantity ,b.notInIquantity,b.inIquantity,c.cVenState,c.cgState,c.otherState ,a.cInvCode1,a.cInvAddCode1,a.cInvName1,a.cInvStd1
from v_wwckqk a left join v_wwqk b on a.MODetailsID=b.MODetailsID left join zyMpState c on a.MODetailsID=c.ID

insert into wwqk (cCode,MODetailsID,cInvCode,cInvAddCode,cInvName,cInvStd,iquantity,cVenCode,cVenAbbName,
dStartDate,dArriveDate,notInIquantity,inIquantity,cVenState,cgState,otherState) 
select 
a.cCode,a.MODetailsID,a.cInvCode,a.cInvAddCode,a.cInvName,a.cInvStd,a.iQuantity,
a.cVenCode,a.cVenAbbName,a.dStartDate,a.dArriveDate,
a.notInIquantity,a.inIquantity,c.cVenState,c.cgState,c.otherState 
from v_wwqk a left join zyMpState c on a.MODetailsID=c.ID where a.MODetailsID not in (select MODetailsID from v_wwckqk) 

select * from wwqk   order by cInvCode

end
--exec proc_zyswwqk 
--drop table wwqk