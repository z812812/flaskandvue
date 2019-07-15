--select * from rdrecords01_ExtraDefine
--top 5 xcl.cWhCode as 仓库编码,xcl.cInvCode as 存货编码,xcl.cBatch as 批号,zdy.cbdefine2 as 请购人 gysda.cVenAbbName as 供应商简称 cgdd.cVenCode as 采购供应商编码
--distinct

 --alter view v_xcl as 
 select     Warehouse.cWhCode as 仓库编码,xcl.cInvCode as 存货编码,
 chda.cInvName as 存货名称,chda.cInvStd as 规格型号,xcl.cBatch as 批号,xcl.iQuantity as 可用数量,
 chda.cInvAddCode as 存货代号,cgrk.cBusType as 采购类型,cgrk.cOrderCode as   采购订单号,
 cgrk.dnverifytime as 入库时间,cgddz.iQuantity as 采购数量, cgdd.cVenCode as 采购供应商编码,gysda.cVenAbbName as 供应商简称,
 qg.cCode as 请购单号,zdy.cbdefine29 as 请购人,qg.cMaker as 请购单制单人, qg.cVerifier as 请购单审核人,qg.cAuditDate as 请购审核日期
 from currentstock xcl
 inner join rdrecords01 cgrkz on xcl.cBatch=cgrkz.cBatch
 inner join RdRecord01 cgrk on cgrk.id=cgrkz.ID
 inner join rdrecords01_ExtraDefine zdy on zdy.autoid=cgrkz.AutoID
 inner join Inventory chda on chda.cInvCode=xcl.cInvCode
 inner join po_pomain cgdd on cgdd.cPOID=cgrk.cOrderCode
 right join po_podetails cgddz on cgddz.POID=cgdd.POID
 inner join Vendor gysda on gysda.cVenCode=cgdd.cVenCode
 inner join PU_AppVouch qg on qg.cCode=cgdd.cappcode
 inner join PU_AppVouchs qgz on qgz.ID=qg.ID
 inner join Warehouse on xcl.cWhCode=Warehouse.cWhCode
 
 
  

