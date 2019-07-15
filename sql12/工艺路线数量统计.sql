--select * from sfc_prouting 

--select a.SubFlag,a.PlanSubFlag,* from sfc_proutpartingdetail a 
--inner join sfc_prouting b on a.PRoutingId=b.PRoutingId
-- where a.SubFlag<>0 or a.PlanSubFlag<>0 
 --查看有委外工序的物料
--create view v_zy_gylx as 
select distinct  b.InvCode,e.cInvName ,e.cInvAddCode,e.cInvStd from sfc_proutingpart a 
left join bas_part b on a.PartId=b.PartId
left join sfc_prouting c on a.PRoutingId=c.PRoutingId
left join sfc_proutingdetail d on c.PRoutingId=d.PRoutingId
left join inventory e on b.InvCode=e.cInvCode
where d.SubFlag<>0 or d.PlanSubFlag<>0


select invcode,cInvName,cInvStd,cInvAddCode,COUNT(*) 数量 from  sfc_proutingpart a 
left join bas_part b on a.PartId=b.PartId
left join sfc_prouting c on a.PRoutingId=c.PRoutingId
--left join sfc_proutingdetail d on c.PRoutingId=d.PRoutingId
left join inventory e on b.InvCode=e.cInvCode
group by invcode,cInvName,cInvStd,cInvAddCode



--where InvCode='140105108-1'



