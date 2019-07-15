create view v_ww_cg_state_zy as
select ccode as 订单号,ivouchrowno 行号,cvoucherstate 状态,cptname 类别,cvencode 供应商编码,cvenname 供应商名称,cinvcode 存货编码,cinvname 存货名称,cinvstd 规格型号,cinvaddcode 存货代码,cinvdefine2 材质,iquantity 订单数量,imaterialsendqty 发货数量 ,ireceivedqty 累计入库数量,iquantity-ireceivedqty 未入库数量,cmaker 制单人,ddate 制单时间,darrivedate 计划到货时间,csource 来源,cplanlotnumber 来源说明
from om_mobody a inner join om_mohead b on a.moid = b.moid
where dbclosedate is null and iquantity<>ireceivedqty and cvoucherstate <>'关闭'  and cbcloser =''

union all
--select moid,ccode,ddate,cvencode,cvenname,cptname,cvoucherstate,cCurrentAuditor from om_mohead
--select cbcloser,* from om_mobody

select cpoid,ivouchrowno,cvoucherstate,cbustype,cvencode,cvenname,cinvcode ,cinvname,cinvstd,cinvaddcode,cinvdefine2,iquantity,null,ireceivedqty,iquantity-ireceivedqty,cmaker,dpodate,darrivedate,csource,csocode


 from zpurpotail a inner join zpurpoheader b on a.poid=b.poid
 where cbcloser='' and iquantity<>ireceivedqty 

--select poid,cbustype,cpoid,dpodate,cvencode,cvenname,cmaker,cvoucherstate,caudittime from zpurpoheader
--select csource,csocode from zpurpotail

