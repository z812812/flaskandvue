/*select * from PU_AppVouchs

select iAppIds,POID,* from po_podetails where iAppIds='1000111167'
select * from po_pomain
select iPOsID,cBatch,* from rdrecords01 where iPOsID='1000198317'
select * from RdRecords01 where ID='1001041501'

select * from currentstock where cBatch='1902270601806' and cInvCode='410402016'

select * from rdrecords11 where cBatch='1902270601806' and cInvCode='410402016'      p.cCode,
*/

select p.cCode �빺����,pu.ivouchrowno �빺�к�,p.cMaker �빺�Ƶ���,p.cVerifier �빺�����,pu.cbcloser �빺�ر���,p.cmaketime �빺�Ƶ�ʱ��,p.cAuditDate �빺���ʱ��,
		pu.cInvCode ���ϱ���,inv.cInvName ��������,inv.cInvStd ����ͺ�,inv.cInvAddCode �������,pu.fQuantity �빺����,pu.dRequirDate ��������,
		pu.cDefine32 �빺��,pu.cDefine33 �빺��ע,
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