select a.cInvCode ,c.cInvName,cInvStd,cInvAddCode,cPurPersonCode,d.cPersonName,a.iReceivedQTY,fQuantity,b.cCode,a.ivouchrowno,fQuantity-ISNULL(a.iReceivedQTY,0) as iquantity
from PU_AppVouchs a inner join PU_AppVouch b on a.ID=b.ID 
	left join inventory c on a.cInvCode=c.cInvCode
	left join Person d on c.cPurPersonCode=d.cPersonCode
where fQuantity-ISNULL(a.iReceivedQTY,0)<>0 and a.cbcloser is  null and b.cAuditDate is not null
--group by cCode
--where b.cCode='19060469' --and a.ivouchrowno=11