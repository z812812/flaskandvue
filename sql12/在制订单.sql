update ufdata_003_2016..mom_orderdetail 
set Status=4,CloseDate=getdate(),CloseTime=getdate(),CloseUser='14322' 
select * from mom_orderdetail 
where  modid in (select modid from ufdata_003_2016..jb_vw_�����깤��� where  �ر�ʱ�� is null and isnull(������������,0)-isnull(�������,0)-isnull(���Ͼܾ�����,0)<=0)