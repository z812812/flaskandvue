--���ݲ��ϳ��ⵥ�Ÿĳ��ⲿ��
use UFDATA_003_2016
update rdrecord11 set cDepCode='22' where ccode='1801E03059'
--���ݵ������Ÿ�ת�����ź�ת�벿��
use UFDATA_003_2016
update TransVouch set cODepCode='ת�����ű��� ',cIDepCode='ת�벿�ű��� ' where cTVCode='���������� '

--�����������ⵥ�Ÿĳ������
use UFDATA_003_2016
update RdRecord09 set crdcode='209' where ccode='1802F01330'

--�����������뵥���Ÿĳ��ⲿ��
use UFDATA_003_2016
update MaterialAppVouch set cDepCode='6631' where ccode='1801K00029'


--���ݲ��ϳ��ⵥ�Ÿĳ������
use UFDATA_003_2016
update rdrecord11 set crdcode='216' where ccode='1805e07971'

--�����깤���Ÿĵ�������
use UFDATA_003_2016
update sfc_pfreport set DocDate='2017-12-01' where DocCode='1710034153'

--�����������ⵥ�Ÿĳ��ⲿ��
use UFDATA_003_2016
update RdRecord09 set cDepCode='6624' where ccode='1801F00382'

--���ݵ������Ÿĳ�������������
use UFDATA_003_2016
update TransVouch set cIRdCode='209',cORdCode='108'where cTVCode='1802G00523'

