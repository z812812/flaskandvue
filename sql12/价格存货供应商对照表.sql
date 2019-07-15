create view v_zy_venandpriceandinventory as 
select (case iPlanDefault when 1 then '自制' when 2 then '委外' when 3 then '采购' else '错误' end) as 计划默认属性
,a.cInvCode as 存货编码,cInvName as 存货名称,isnull(cInvStd,'无') as 规格型号,isnull(cInvAddCode,'无') as 存货代码 ,b.CVenCode as 供应商编码,d.cVenName as 供应商名称,
(case b.iSuppProperty when 1 then '采购' when 2 then '委外' else '错误' end) as 供应类型
,c.iTaxUnitPrice as 含税价格 ,c.iUnitPrice as 不含税价格,c.iTaxRate as 税率,c.dEnableDate as 生效日期,c.dDisableDate as   失效日期
from inventory a left join VenAndInv b on a.cInvCode=b.cInvCode
left join (select * from Ven_Inv_Price  where dDisableDate >= GETDATE()) c on c.cVenCode=b.CVenCode and c.cInvCode=b.cInvCode and c.iSupplyType=b.iSuppProperty
left join Vendor d on d.cVenCode=b.cVenCode
where iPlanDefault<>1 and a.cInvCode not like '09%' and a.cInvCode not like '8%' and a.dEDate  is null
--order by 存货编码


--select count(*) from inventory where iPlanDefault<>1 and cInvCode not like '09%' and cInvCode not like '8%'
--select top 1 * from Ven_Inv_Price

--select top 10 dEDate,* from inventory 