alter view v_price as 
select ch.cInvCode as �������,ch.cInvAddCode as �������,ch.cInvName as �������,ch.cInvStd as ����ͺ�,
                   (case ch.bPurchase when 1 then '��' when 0 then '��' end) as �Ƿ�ɹ�,(case ch.bProxyForeign  when 1 then '��' when 0 then '��' end)as �Ƿ�ί��,
                   jg.cVenCode as ��Ӧ�̱���,gys.cVenName as ��Ӧ������,jg.iUnitPrice as ��˰����,jg.iTaxUnitPrice as ��˰����,jg.iTaxRate as ˰��,
                   jg.dEnableDate as ��Ч����,jg.dDisableDate as ʧЧ����
                   from inventory ch 
                   left join Ven_Inv_Price jg on ch.cInvCode=jg.cInvCode
                   left join Vendor gys on jg.cVenCode=gys.cVenCode
                  