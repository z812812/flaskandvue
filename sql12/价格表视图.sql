alter view v_jgb
as 
select  (case jgb.iSupplyType when 1 then '�ɹ�' when 2 then 'ί��' end) as ��Ӧ����
         ,jgb.cVenCode as ��Ӧ�̱���,gysda.cVenName as ��Ӧ������, jgb.cInvCode as  �������,chda.cInvAddCode as �������,
        chda.cinvname as �������,chda.cInvStd as ����ͺ�,  tjdz.iTaxRate as ˰��,jgb.iUnitPrice as ԭ�ҵ���,jgb.iTaxUnitPrice as ��˰����,
		tjdz.cbodymemo as ���屸ע, tjdz.cdefine29 as ����, tjdz.dstartdate as ��Ч����, tjdz.denddate as ʧЧ����,
		tjd.ddate as �Ƶ�����, tjd.cmaker as �Ƶ���,tjd.ccode as ���۵���,tjdkz.cbdefine15 as ����С�Ʋ������ϲ���˰,
		tjdkz.cbdefine28 as �����ϵ�����������ϲο�����˰,tjdkz.cbdefine16 as ��ע,tjdkz.cbdefine27 as ���ϼ۸� ,tjdkz.cbdefine2 as ��������,tjdkz.cbdefine3 as ���쵥��,
		tjdkz.cbdefine20 as �͵��ۺϼ�,tjdkz.cbdefine18 as ������������,tjdkz.cbdefine4 as ���𵥼�,tjdkz.cbdefine21  as ����۸�,
		tjdkz.cbdefine5 as ���赥��,tjdkz.cbdefine22 as ����۸�,
		
		tjdkz.cbdefine6 as ��������,tjdkz.cbdefine1 as �ֳ�����,tjdkz.cbdefine7 as ������,
		tjdkz.cbdefine8 as ת�׵���,tjdkz.cbdefine9 as ��˿����,tjdkz.cbdefine10 as ϳ����,
		tjdkz.cbdefine19 as ������������,tjdkz.cbdefine11 as ���ʵ���,tjdkz.cbdefine23 as ���ʼ۸�,tjdkz.cbdefine12 as �������赥��,
		tjdkz.cbdefine24 as ��������۸�,tjdkz.cbdefine13 as ��̼����,
		tjdkz.cbdefine25 as ��̼�۸�,tjdkz.cbdefine14 ��𵥼�,tjdkz.cbdefine26 as ���۸�,tjdkz.cbdefine30 as �ȴ�������۸�,tjdkz.cbdefine31 as �����۸�
from Ven_Inv_Price jgb
     inner join PU_PriceJustDetail tjdz on tjdz.autoid=jgb.ipriceautoid
     inner join PU_PriceJustDetail_extradefine tjdkz on tjdkz.autoid=tjdz.autoid
     inner join PU_PriceJustMain tjd on tjd.id=tjdz.id 
     inner join Inventory chda on chda.cInvCode=jgb.cInvCode
     inner join Vendor gysda on gysda.cVenCode=jgb.cVenCode