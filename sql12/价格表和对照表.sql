--select top 5 CVenCode,cInvCode,iSuppProperty,AutoID from venandinv
create view v_invandvenNoduizhao as
select  a.cInvCode,d.cInvName,d.cInvStd ,d.cInvAddCode,a.cVenCode ,c.cVenName,(case a.iSupplyType when 1 then '�ɹ�' when 2 then 'ί��' else '����' end) as ��Ӧ���� ,dEnableDate,dDisableDate, isnull(b.autoid,0) as û���վ�����
from Ven_Inv_Price a left join VenAndInv b on a.cVenCode=b.CVenCode and a.cInvCode=b.cInvCode and a.iSupplyType=b.iSuppProperty
inner join Vendor c on a.cVenCode=c.cVenCode
inner join inventory d on a.cInvCode=d.cInvCode
where dDisableDate>=GETDATE()

