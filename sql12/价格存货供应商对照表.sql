create view v_zy_venandpriceandinventory as 
select (case iPlanDefault when 1 then '����' when 2 then 'ί��' when 3 then '�ɹ�' else '����' end) as �ƻ�Ĭ������
,a.cInvCode as �������,cInvName as �������,isnull(cInvStd,'��') as ����ͺ�,isnull(cInvAddCode,'��') as ������� ,b.CVenCode as ��Ӧ�̱���,d.cVenName as ��Ӧ������,
(case b.iSuppProperty when 1 then '�ɹ�' when 2 then 'ί��' else '����' end) as ��Ӧ����
,c.iTaxUnitPrice as ��˰�۸� ,c.iUnitPrice as ����˰�۸�,c.iTaxRate as ˰��,c.dEnableDate as ��Ч����,c.dDisableDate as   ʧЧ����
from inventory a left join VenAndInv b on a.cInvCode=b.cInvCode
left join (select * from Ven_Inv_Price  where dDisableDate >= GETDATE()) c on c.cVenCode=b.CVenCode and c.cInvCode=b.cInvCode and c.iSupplyType=b.iSuppProperty
left join Vendor d on d.cVenCode=b.cVenCode
where iPlanDefault<>1 and a.cInvCode not like '09%' and a.cInvCode not like '8%' and a.dEDate  is null
--order by �������


--select count(*) from inventory where iPlanDefault<>1 and cInvCode not like '09%' and cInvCode not like '8%'
--select top 1 * from Ven_Inv_Price

--select top 10 dEDate,* from inventory 