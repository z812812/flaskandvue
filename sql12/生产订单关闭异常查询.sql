update ufdata_003_2016..mom_orderdetail 
set Status=4,CloseDate=getdate(),CloseTime=getdate(),CloseUser='0027' 
where MoDId in (select modid from ufdata_003_2016..jb_vw_�����깤���
where  �ر�ʱ�� is null and isnull(ί������,0)=0 and 
( �깤״̬='�깤'  or ( isnull(������������,0)-isnull(�������,0)-isnull(���Ͼܾ�����,0)<=0)))

select * from ufdata_003_2016..jb_vw_�����깤��� where ��������='19050296' and  �к�=12