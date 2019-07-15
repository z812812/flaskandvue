
select * from bas_part
select * from bom_bom
select * from bom_parent
select OptionsId,* from bom_opcomponent where BomId='1000004595'
-- ¸ü¸ÄÆ«Ö´ÆÚ
update bom_opcomponentopt
set Offset=-5
where OptionsId  in (select OptionsId from bom_opcomponent where ComponentId in (select partid from bas_part where InvCode like '14%' ))
and Offset<>-5


select * from bom_opcomponentopt where OptionsId = 1000012075


select * from bom_parent a inner join bom_opcomponent b on a.BomId=b.BomId where ParentId=(select PartId from bas_part where InvCode='150101424-1')

select partid from bas_part where InvCode like '16%' 

select OptionsId from bom_opcomponent where ComponentId in (select partid from bas_part where InvCode like '16%' or InvCode like '17%' )



select Offset from bom_opcomponentopt
--update bom_opcomponentopt
--set Offset=-1
where OptionsId  in (select OptionsId from bom_opcomponent where ComponentId in (select partid from bas_part where InvCode like '11%'))
and Offset<>0