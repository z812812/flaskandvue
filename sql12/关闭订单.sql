update mom_orderdetail
set Status=4,CloseDate=getdate(),CloseTime=getdate(),CloseUser='14322' 
where MoId in(select moid from mom_order where MoCode='17110079') and SortSeq=13

select Status,MoId,SortSeq from mom_orderdetail
where CloseUser='14322' and CloseDate>'20180101'
