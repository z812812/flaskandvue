--create  view v_bas_partzy as
--select PartId,InvCode from bas_part 
--where InvCode like '10%' or InvCode like '11%' or InvCode like '12%' or InvCode like '14%' or InvCode like '15%'
alter view vv_bom as
select   b1.invcode as one,b2.invcode as two,b3.invcode as three --,isnull(b4.invcode,0)as four,isnull(b5.invcode,0)as five,isnull(b6.invcode,0) as six 
              from bas_part b1
              inner join bom_parent p1 on p1.ParentId=b1.partid
              left join bom_opcomponent s1 on s1.BomId=p1.BomId
              left join bas_part b2 on b2.partid=s1.ComponentId
              left join bom_parent p2 on p2.ParentId=b2.partid
              left join bom_opcomponent s2 on s2.BomId=p2.BomId
              left join bas_part b3 on b3.partid=s2.ComponentId
              left join bom_parent p3 on b3.partid=p3.ParentId
              left join bom_opcomponent s3 on s3.BomId=p3.BomId
             /* left join v_bas_partzy b4 on b4.partid=s3.ComponentId
              left join bom_parent p4 on b4.partid=p4.ParentId
              left join bom_opcomponent s4 on s4.BomId=p4.BomId
              left join v_bas_partzy b5 on b5.partid=s4.ComponentId
              left join bom_parent p5 on b5.partid=p5.ParentId
              left join bom_opcomponent s5 on s5.BomId=p5.BomId
              left join v_bas_partzy b6 on b6.partid=s5.ComponentId
              left join bom_parent p6 on b6.partid=p6.ParentId
              left join bom_opcomponent s6 on s6.BomId=p6.BomId
              left join v_bas_partzy b7 on b7.partid=s6.ComponentId*/
where      b1.InvCode like '10%' or b1.InvCode like '11%'

--select * from vv_bom