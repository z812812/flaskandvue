update ufdata_003_2016..mom_orderdetail 
set Status=4,CloseDate=getdate(),CloseTime=getdate(),CloseUser='14322' 
select * from mom_orderdetail 
where  modid in (select modid from ufdata_003_2016..jb_vw_订单完工情况 where  关闭时间 is null and isnull(生产订单数量,0)-isnull(入库数量,0)-isnull(报废拒绝数量,0)<=0)