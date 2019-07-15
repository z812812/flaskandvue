--alter view v_lrpxcl as
--select cInvCode ,SUM(iQuantity) as iquantity from currentstock where iquantity>0 and cWhCode<'0310'
--group by cInvCode having cInvCode<'129999999' 

create view v_xclzj as
select  v.cInvCode,c.InvCode,v.iquantity from v_lrpxcl v
               inner join bas_part b on v.cInvCode=b.InvCode
               inner join bom_opcomponent bo on bo.ComponentId=b.PartId
               inner join bom_parent bom on bo.BomId=bom.BomId
               inner join bas_part c on bom.ParentId=c.PartId
               where v.cInvCode>'100000000'


--select * from  bas_part 
             
             
             --l--eft join bom_parent on bas_part.PartId=bom_parent.ParentId
             ---left join bom_opcomponent z on z.bomId=bom_parent.BomId 
             --inner join bas_part y on z.ComponentId=y.PartId
             --inner join v_lrpxcl lrp on lrp.cinvcode=y.InvCode
             