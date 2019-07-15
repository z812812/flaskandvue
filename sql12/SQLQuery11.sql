 select  distinct top 30  currentstock.cWhCode as [仓库编码],currentstock.cInvCode as [存货编码],
 Inventory.cInvName as [存货名称],Inventory.cInvStd as [规格型号],currentstock.cBatch as [批号],currentstock.iQuantity as [可用数量],
 Inventory.cInvAddCode as [规格型号],RdRecord01.cBusType as [采购类型],RdRecord01.cOrderCode as   [采购订单号],
 RdRecord01.dnverifytime as [入库时间],po_podetails.iQuantity as [采购数量], po_pomain.cVenCode as [采购供应商编码],Vendor.cVenAbbName as [供应商简称],
 PU_AppVouch.cCode as [请购单号],rdrecords01_ExtraDefine.cbdefine29 as [请购人],PU_AppVouch.cMaker as [请购单制单人], PU_AppVouch.cVerifier as [请购单审核人],PU_AppVouch.cAuditDate as [请购审核日期]
 from currentstock 
 inner join rdrecords01  on currentstock.cBatch=rdrecords01.cBatch
 inner join RdRecord01  on RdRecord01.id=rdrecords01.ID
 inner join rdrecords01_ExtraDefine  on rdrecords01_ExtraDefine.autoid=rdrecords01.AutoID
 inner join Inventory  on Inventory.cInvCode=currentstock.cInvCode
 inner join po_pomain  on po_pomain.cPOID=RdRecord01.cOrderCode
 inner join po_podetails  on po_podetails.POID=po_pomain.POID
 inner join Vendor  on Vendor.cVenCode=po_pomain.cVenCode
 inner join PU_AppVouch  on PU_AppVouch.cCode=po_pomain.cappcode
 inner join PU_AppVouchs  on PU_AppVouchs.ID=PU_AppVouch.ID
 where currentstock.cWhCode='0100'