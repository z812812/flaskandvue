update mom_orderdetail
set QcFlag=0
where QcFlag<>0

select * from mom_orderdetail where QcFlag=0