--select top 5 CVenCode,cInvCode,iSuppProperty,AutoID from venandinv
create view v_invandvenNoduizhao as
select  a.cInvCode,d.cInvName,d.cInvStd ,d.cInvAddCode,a.cVenCode ,c.cVenName,(case a.iSupplyType when 1 then '采购' when 2 then '委外' else '其他' end) as 供应类型 ,dEnableDate,dDisableDate, isnull(b.autoid,0) as 没对照就是零
from Ven_Inv_Price a left join VenAndInv b on a.cVenCode=b.CVenCode and a.cInvCode=b.cInvCode and a.iSupplyType=b.iSuppProperty
inner join Vendor c on a.cVenCode=c.cVenCode
inner join inventory d on a.cInvCode=d.cInvCode
where dDisableDate>=GETDATE()

