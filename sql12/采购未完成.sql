/*alter view v_cgqk
as

select  c.ID,c.iQuantity,d.cPOID,c.dArriveDate ,h.cVenCode,h.cVenAbbName,SUM(e.iQuantity) as inIquantity,c.iQuantity-sum(isnull(e.iQuantity,0)) as notInIquantity,
c.cInvCode,g.cInvAddCode,g.cInvName,g.cInvStd,i.cVenState,i.cgState
from  PO_Podetails c
                                   left join PO_Pomain d on c.POID=d.POID
                                   left join rdrecords01 e on c.ID=e.iPOsID
                                   left join rdrecord01  f on e.ID=f.ID
                                   inner join inventory g on c.cInvCode=g.cinvcode
                                   inner join Vendor h on d.cVenCode=h.cVenCode
                                   left join zyMpState i on c.id=i.id
where c.cbCloseDate is null and c.cInvCode between '100000000' and '129999999' 

group by c.ID,c.iQuantity,d.cPOID,h.cVenCode,h.cVenAbbName,c.cInvCode,g.cInvAddCode,g.cInvName,g.cInvStd,c.dArriveDate,i.cVenState,i.cgState
having   c.iQuantity-sum(e.iQuantity)>0 or sum(e.iQuantity) is null
--order by c.dArriveDate
*/
--委外入库数量
alter view v_wwqk as 
select   d.cCode,c.MODetailsID,c.cInvCode,g.cInvAddCode,g.cInvName,g.cInvStd,c.iQuantity,
d.cVenCode,h.cVenAbbName,c.dStartDate,c.dArriveDate,
c.iQuantity-sum(isnull(e.iQuantity,0)) as notInIquantity,sum(e.iQuantity)as inIquantity,i.cVenState,i.cgState
from  OM_MODetails c
                                   left join OM_MOMain d on c.MOID=d.MOID
                                   left join rdrecords01 e on c.MODetailsID=e.iOMoDID
                                   left join rdrecord01  f on e.ID=f.ID
                                   inner join inventory g on c.cInvCode=g.cinvcode
                                   inner join Vendor h on d.cVenCode=h.cVenCode
                                   left join zyMpState i on c.MODetailsID=i.id
                                   
where c.cbCloser is null and c.cInvCode between '100000000' and '129999999'  and isnull(e.iQuantity,0)>=0 
group by c.MODetailsID,c.iQuantity,d.cCode,d.cVenCode,h.cVenAbbName,c.cInvCode,c.dStartDate,c.dArriveDate,g.cInvAddCode,g.cInvName,g.cInvStd,i.cVenState,i.cgState
--having   c.iQuantity-sum(e.iQuantity)>0 or sum(e.iQuantity) is null
--order by c.dArriveDate
--select * from v_wwqk

--材料出库数量
/*alter view v_wwckqk as 
select   d.cCode,c.MODetailsID,c.cInvCode,g.cInvAddCode,g.cInvName,g.cInvStd,c.iQuantity,
d.cVenCode,h.cVenAbbName,c.dStartDate,c.dArriveDate,e.cinvcode as cinvcode1,i.cInvAddCode as cInvAddCode1,i.cInvName as cInvName1,i.cInvStd as cInvStd1,
c.iQuantity-sum(isnull(e.iQuantity,0)) as notOutIquantity,sum(isnull(e.iQuantity,0))as outIquantity
from  OM_MODetails c
                                   left join OM_MOMain d on c.MOID=d.MOID
                                   left join rdrecords11 e on e.iOMoDID=c.MODetailsID
                                   
                                   inner join inventory g on c.cInvCode=g.cinvcode
                                   inner join Vendor h on d.cVenCode=h.cVenCode
                                   inner join inventory i on e.cInvCode=i.cinvcode
                                   
                                   
where c.cbCloser is null and c.cInvCode between '100000000' and '129999999'  
group by c.MODetailsID,c.iQuantity,d.cCode,d.cVenCode,h.cVenAbbName,c.cInvCode,c.dStartDate,
c.dArriveDate,g.cInvAddCode,g.cInvName,g.cInvStd,e.cinvcode,i.cInvAddCode,i.cInvName,i.cInvStd
--having   c.iQuantity-sum(e.iQuantity)>0 or sum(e.iQuantity) is null
--order by c.MODetailsID,c.dArriveDate

select * from v_wwckqk */