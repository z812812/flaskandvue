select * from v_currentstockzy_noqc where cinvcode='210103001'

select top 50 * from v_currentstockzy
select top 50 * from v_currentstockzy_noqc
select top 50 * from currentstock

create view [dbo].[v_currentstockzy_noqc_nody_nocw] as 
select cinvcode,SUM(iQuantity)as iquantity from currentstock 
where iquantity <>0 and cWhCode<>'0800'  and cWhCode<>'1303' and  cWhCode<>'1304' and cWhCode<>'1305' and cWhCode not like '9%' group by cInvCode 

drop view v_currentstockzy_noqc