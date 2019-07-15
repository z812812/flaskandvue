update ufdata_003_2016..mom_orderdetail 
set Status=4,CloseDate=getdate(),CloseTime=getdate(),CloseUser='0027' 
where MoDId in (select modid from ufdata_003_2016..jb_vw_订单完工情况
where  关闭时间 is null and isnull(委外结存数,0)=0 and 
( 完工状态='完工'  or ( isnull(生产订单数量,0)-isnull(入库数量,0)-isnull(报废拒绝数量,0)<=0)))

select * from ufdata_003_2016..jb_vw_订单完工情况 where 生产订单='19050296' and  行号=12