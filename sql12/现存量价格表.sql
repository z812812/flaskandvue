alter view v_xclprice as 
select d.cgdate as �����������,e.cldate as ���ϳ�����������,f.cldate as ������������, a.cinvcode as �������,b.cInvAddCode as �������,b.cInvName as �������,b.cInvStd as ����ͺ�,a.iquantity as �ִ�����,
                 case b.bPurchase when 1 then '��' else '��' end as �Ƿ�ɹ�, case b.bProxyForeign when 1 then '��' else '��' end as �Ƿ�ί��,case b.bSelf when 1 then '��' else '��' end as �Ƿ�����,
                 c.cVenCode as ��Ӧ�̱���,c.cVenName as ��Ӧ������,p.iTaxRate as ˰��,iUnitPrice as ��˰����,iTaxUnitPrice as ��˰����,p.dEnableDate as ��Ч����,p.dDisableDate as ʧЧ���� 
                 from v_currentxcl a
                 left join ven_inv_price p on a.cinvcode=p.cinvcode 
                 inner join inventory b on b.cInvCode=a.cinvcode
                 left join Vendor c on c.cVenCode = p.cVenCode
                 left join v_cgrkd d on d.cinvcode=a.cinvcode
                 left join v_clck e on e.cinvcode=a.cInvCode
                 left join v_qtck f on f.cinvcode=a.cInvCode
              
              