create view v_qgjdb
as
select  b.cCode as �빺����,a.cInvCode as ���ϱ���,g.cInvAddCode as �������,g.cInvName as �������,
        g.cInvStd as ����ͺ�,a.fQuantity as �빺����,b.dDate as ��������,a.cDefine37 as ��������,
        d.cPOID as �ɹ�����,c.cDefine36 as ��������,f.cCode as ��ⵥ��,f.dDate as ������� 
from PU_AppVouchs  a inner join PU_AppVouch b on a.ID=b.ID
                                   left join PO_Podetails c on a.AutoID=c.iAppIds
                                   left join PO_Pomain d on c.POID=d.POID
                                   left join rdrecords01 e on c.ID=e.iPOsID
                                   left join rdrecord01  f on e.ID=f.ID
                                   inner join inventory g on a.cInvCode=g.cinvcode
                                   