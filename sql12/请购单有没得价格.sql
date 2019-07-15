alter view v_qgdwjg as
select b.cCode  as 请购单号,b.cMakeTime as  制单日期,b.cAuditTime as 审核日期  ,a.cDefine37 as 要求到货日期,a.cDefine32 as 请购人, isnull(b.cVerifier,'还未审核') as 审核人,a.cinvcode as 存货编码,g.cInvName as 存货名称,g.cInvStd as 规格型号,g.cInvAddCode as 存货代码,a.fQuantity as 数量,
d.cVenCode 供应商代码,h.cVenName as 供应商名称,(case h.bVenService  when 1 then '停止供货' when 0 then '请下采购订单' else '请询价格' end )as 是否供货,d.dDisableDate as 失效日期 
 from PU_AppVouchs a inner join PU_AppVouch b on a.ID=b.ID
                             left join  PO_Podetails c on a.AutoID=c.iAppIds
                             left join 

(select * from Ven_Inv_Price where dDisableDate>GETDATE()) d on a.cInvCode=d.cInvCode
inner join inventory g on a.cInvCode=g.cinvcode
left join Vendor h on d.cVenCode=h.cVenCode
where c.id is null and b.cCloser is null 

select top 1000 b.cCode,* from PU_AppVouchs a  inner join PU_AppVouch b on a.ID=b.ID
