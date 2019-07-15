select * from PO_Pomain where cPOID='WW19060189'
update PO_Pomain
set cVenName='重庆市北碚区鹏康机械厂'
where cPOID='WW19060189'

select * from PO_Podetails where cPOID='WW19060189' order by irowno

select * from UFDATA_003_2016..po_podetails where ID in (select poids from kskf..PO_Podetails where cPOID='WW19060152' )

select * from UFDATA_003_2016..OM_MOMain where cCode='WW19060152'
--委外订单
select MODetailsID,dArriveDate,cinvcode,iVouchRowNo from UFDATA_003_2016..OM_MODetails where MOID=(select MOID from UFDATA_003_2016..OM_MOMain where cCode='WW19060152')
select poids,dArriveDate,cinvcode,cPOID,irowno from PO_Podetails where cPOID='WW19060152' order by irowno

--采购订单

select dArriveDate,ID,ivouchrowno from UFDATA_003_2016..po_podetails where POID=(select POID from UFDATA_003_2016..po_pomain  where cPOID='CG19060158')
select dArriveDate,POIDs,cPOID,irowno from PO_Podetails where cPOID='CG19060158' order by irowno

update UFDATA_003_2016..po_podetails
set dArriveDate='2019-7-10'
where ID='1000219922'

update kskf..PO_Podetails
set dArriveDate='2019-7-10'
where POIDs='1000219922'

select * from dbo.Messagets order by ID desc

delete dbo.Messagets where ID in ('1905','1906')

select a.cPOID,a.POIDs,a.dArriveDate,a.cInvCode,a.cInvName,a.cInvStd,b.cBusType,b.cVenCode from kskf..PO_Podetails a left join kskf..PO_Pomain b on a.POID=b.POID 
where a.cPOID='WW19050168'  and irowno='59'

select distinct cbustype from PO_Pomain