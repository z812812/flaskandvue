select Status,* from bom_bom where BomId=1000109593

select * from bom_parent 

select * from bom_opcomponent

select * from bas_part

select * from bom_opcomponentopt 


select f.Status,c.InvCode,d.InvCode,e.Offset from bom_parent a 
inner join bom_opcomponent b on a.BomId=b.BomId 
inner join bas_part c on a.ParentId=c.PartId 
inner join bas_part d on b.ComponentId=d.PartId
inner join bom_opcomponentopt e on b.OptionsId=e.OptionsId
inner join bom_bom f on a.BomId=f.BomId
where  f.Status<>3

select a.*,Status,c.InvCode,d.cInvName,d.cInvStd,d.cInvAddCode,a.Version,a.BomId from bom_bom a inner join  bom_parent b on a.BomId=b.BomId
inner join bas_part c on b.ParentId=c.PartId
inner join inventory d on c.InvCode=d.cInvCode
where d.cInvCode='100101202'
--  检查物料清单有几个版本
select InvCode,cInvName,cInvStd,cInvAddCode ,count(*) from bom_bom a inner join  bom_parent b on a.BomId=b.BomId
inner join bas_part c on b.ParentId=c.PartId
inner join inventory d on c.InvCode=d.cInvCode
where a.BomType<>7
group by InvCode,cInvName,cInvStd,cInvAddCode
having count(*)<>1

select distinct AuditStatus  from bom_bom where BomType<>7
--查看未审核物料清单
select d.cInvCode from bom_bom a inner join  bom_parent b on a.BomId=b.BomId
left join bas_part c on b.ParentId=c.PartId
inner join inventory d on c.InvCode=d.cInvCode
where a.BomType<>7 and RelsUser is null