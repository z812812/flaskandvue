/*select * from PU_AppVouchs

select iAppIds,POID,* from po_podetails where iAppIds='1000111167'
select * from po_pomain
select iPOsID,cBatch,* from rdrecords01 where iPOsID='1000198317'
select * from RdRecords01 where ID='1001041501'

select * from currentstock where cBatch='1902270601806' and cInvCode='410402016'

select * from rdrecords11 where cBatch='1902270601806' and cInvCode='410402016'      p.cCode,
*/

select p.cCode 请购单号,pu.ivouchrowno 请购行号,p.cMaker 请购制单人,p.cVerifier 请购审核人,pu.cbcloser 请购关闭人,p.cmaketime 请购制单时间,p.cAuditDate 请购审核时间,
		pu.cInvCode 物料编码,inv.cInvName 物料名称,inv.cInvStd 规格型号,inv.cInvAddCode 存货代码,pu.fQuantity 请购数量,pu.dRequirDate 需求日期,
		pu.cDefine32 请购人,pu.cDefine33 请购备注,
		o.cPOID,o.cVenCode,ve.cVenName,
		o.cMaker,o.cVerifier,o.cBusType,o.cmaketime,o.cAuditDate,po.iQuantity,
		r01.cCode,r01.cMaker,r01.dnmaketime,r01.dnverifytime,
		rs01.iQuantity,rs01.cBatch,
		cu.iQuantity,
		r11.cCode,r11.dVeriDate,rs11.iQuantity,rs11.cDefine23
from PU_AppVouchs pu
	left join PU_AppVouch p on pu.ID=p.ID
	left join po_podetails po on pu.AutoID=po.iAppIds
	left join po_pomain o on po.POID =o.POID
	left join rdrecords01 rs01 on po.ID=rs01.iPOsID
	left join RdRecord01 r01 on rs01.ID=r01.ID
	left join (select * from currentstock where iQuantity<>0) cu on cu.cInvCode = pu.cInvCode and cu.cBatch=rs01.cBatch
	left join rdrecords11 rs11 on rs11.cInvCode=rs01.cInvCode and rs11.cBatch=rs01.cBatch
	left join rdrecord11 r11 on rs11.ID=r11.ID 
	left join inventory inv on inv.cInvCode=pu.cInvCode
	left join Vendor ve on ve.cVenCode=o.cVenCode


where  isnull(rs01.cBatch,0)<>'01' and p.cCode='19040012' and pu.ivouchrowno=10