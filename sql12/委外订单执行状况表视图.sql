create view v_ww_cg_state_zy as
select ccode as ������,ivouchrowno �к�,cvoucherstate ״̬,cptname ���,cvencode ��Ӧ�̱���,cvenname ��Ӧ������,cinvcode �������,cinvname �������,cinvstd ����ͺ�,cinvaddcode �������,cinvdefine2 ����,iquantity ��������,imaterialsendqty �������� ,ireceivedqty �ۼ��������,iquantity-ireceivedqty δ�������,cmaker �Ƶ���,ddate �Ƶ�ʱ��,darrivedate �ƻ�����ʱ��,csource ��Դ,cplanlotnumber ��Դ˵��
from om_mobody a inner join om_mohead b on a.moid = b.moid
where dbclosedate is null and iquantity<>ireceivedqty and cvoucherstate <>'�ر�'  and cbcloser =''

union all
--select moid,ccode,ddate,cvencode,cvenname,cptname,cvoucherstate,cCurrentAuditor from om_mohead
--select cbcloser,* from om_mobody

select cpoid,ivouchrowno,cvoucherstate,cbustype,cvencode,cvenname,cinvcode ,cinvname,cinvstd,cinvaddcode,cinvdefine2,iquantity,null,ireceivedqty,iquantity-ireceivedqty,cmaker,dpodate,darrivedate,csource,csocode


 from zpurpotail a inner join zpurpoheader b on a.poid=b.poid
 where cbcloser='' and iquantity<>ireceivedqty 

--select poid,cbustype,cpoid,dpodate,cvencode,cvenname,cmaker,cvoucherstate,caudittime from zpurpoheader
--select csource,csocode from zpurpotail

