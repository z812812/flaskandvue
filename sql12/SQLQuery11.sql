 select  distinct top 30  currentstock.cWhCode as [�ֿ����],currentstock.cInvCode as [�������],
 Inventory.cInvName as [�������],Inventory.cInvStd as [����ͺ�],currentstock.cBatch as [����],currentstock.iQuantity as [��������],
 Inventory.cInvAddCode as [����ͺ�],RdRecord01.cBusType as [�ɹ�����],RdRecord01.cOrderCode as   [�ɹ�������],
 RdRecord01.dnverifytime as [���ʱ��],po_podetails.iQuantity as [�ɹ�����], po_pomain.cVenCode as [�ɹ���Ӧ�̱���],Vendor.cVenAbbName as [��Ӧ�̼��],
 PU_AppVouch.cCode as [�빺����],rdrecords01_ExtraDefine.cbdefine29 as [�빺��],PU_AppVouch.cMaker as [�빺���Ƶ���], PU_AppVouch.cVerifier as [�빺�������],PU_AppVouch.cAuditDate as [�빺�������]
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