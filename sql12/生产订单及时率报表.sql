alter view v_zy_test as
select  a.MoCode,b.SortSeq,a.CreateDate,e.StartDate,e.DueDate,b.MoClass,b.Qty,b.MDeptCode,g.cDepName,b.QualifiedInQty,b.Status,
b.InvCode,f.cInvName,f.cInvStd,f.iInvAdvance,c.iQuantity,c.iUnitCost,c.iPrice,d.dDate
from  mom_orderdetail b (nolock) left join mom_order a (nolock) on a.MoId=b.MoId
left join rdrecords10 c (nolock) on c.iMPoIds=b.MoDId
left join rdrecord10 d (nolock) on c.ID=d.ID 
left join mom_morder e (nolock) on b.MoDId=e.MoDId
left join inventory f (nolock) on b.InvCode=f.cInvCode
left join Department g (nolock) on g.cDepCode=b.MDeptCode
where a.CreateDate between '2019-5-10' and '2019-5-15'

--select top 50 * from Department MoCode='19050370' and SortSeq=3

select SUM(iquantity) from v_zy_test where DATEADD(DD,iinvadvance+1,createdate)>=isnull(ddate,'2099-1-1')
group by MDeptCode,cDepName

select SUM(iquantity) from v_zy_test

alter view v_zy_testorder as
select  a.MoCode,b.SortSeq,a.CreateDate,e.StartDate,e.DueDate,b.MoClass,b.Qty,b.MDeptCode,g.cDepName,b.QualifiedInQty,b.Status,
b.InvCode,f.cInvName,f.cInvStd,f.iInvAdvance
from  mom_orderdetail b (nolock) left join mom_order a (nolock) on a.MoId=b.MoId
left join mom_morder e (nolock) on b.MoDId=e.MoDId
left join inventory f (nolock) on b.InvCode=f.cInvCode
left join Department g (nolock) on g.cDepCode=b.MDeptCode
where a.CreateDate between '2019-5-10' and '2019-5-15'

select SUM(QualifiedInQty) from v_zy_testorder


select distinct cdepname,MDeptCode from v_zy_testorder
select SUM(qty) from v_zy_testorder


