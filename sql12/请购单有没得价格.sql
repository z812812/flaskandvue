alter view v_qgdwjg as
select b.cCode  as �빺����,b.cMakeTime as  �Ƶ�����,b.cAuditTime as �������  ,a.cDefine37 as Ҫ�󵽻�����,a.cDefine32 as �빺��, isnull(b.cVerifier,'��δ���') as �����,a.cinvcode as �������,g.cInvName as �������,g.cInvStd as ����ͺ�,g.cInvAddCode as �������,a.fQuantity as ����,
d.cVenCode ��Ӧ�̴���,h.cVenName as ��Ӧ������,(case h.bVenService  when 1 then 'ֹͣ����' when 0 then '���²ɹ�����' else '��ѯ�۸�' end )as �Ƿ񹩻�,d.dDisableDate as ʧЧ���� 
 from PU_AppVouchs a inner join PU_AppVouch b on a.ID=b.ID
                             left join  PO_Podetails c on a.AutoID=c.iAppIds
                             left join 

(select * from Ven_Inv_Price where dDisableDate>GETDATE()) d on a.cInvCode=d.cInvCode
inner join inventory g on a.cInvCode=g.cinvcode
left join Vendor h on d.cVenCode=h.cVenCode
where c.id is null and b.cCloser is null 

select top 1000 b.cCode,* from PU_AppVouchs a  inner join PU_AppVouch b on a.ID=b.ID
