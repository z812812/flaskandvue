select distinct top 30 xcl.cWhCode as �ֿ����,xcl.cInvCode as �������, chda.cInvName as �������,chda.cInvStd as ����ͺ�,xcl.cBatch as ����,xcl.iQuantity as ��������, chda.cInvAddCode as ����ͺ�,cgrk.cBusType as �ɹ�����,cgrk.cOrderCode as �ɹ�������, cgrk.dnverifytime as ���ʱ��,cgddz.iQuantity as �ɹ�����, cgdd.cVenCode as �ɹ���Ӧ�̱���,gysda.cVenAbbName as ��Ӧ�̼��, qg.cCode as �빺����,zdy.cbdefine29 as �빺��,qg.cMaker as �빺���Ƶ���, qg.cVerifier as �빺�������,qg.cAuditDate as �빺������� 
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