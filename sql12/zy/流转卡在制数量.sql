--select b.one,xcl.iquantity from vv_bom b inner join currentstock xcl on b.one=xcl.cInvCode
--where xcl.iQuantity>0
create view v_sumzz as
select   sz.InvCode,SUM(wz.balmachiningqty) as zzsl from sfc_processflowdetail wz 
              left join sfc_processflow w on w.PFId=wz.PFId 
              left join mom_orderdetail sz on sz.MoDId=w.MoDId 
              
where sz.Status=3
group by sz.InvCode
                     