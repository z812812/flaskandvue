alter view  v_zy_mom_orderqingkuang as 
select mocode as ������,SortSeq as �к�,a.InvCode as �������,c.cInvAddCode as �������,c.cInvName as ������� ,c.cInvStd as ����ͺ�,Qty as ��������,QualifiedInQty as �깤����,Qty-QualifiedInQty as δ�������,CreateDate as ����ʱ��,CloseDate as �ر�ʱ�� from mom_orderdetail a inner join mom_order  b on a.MoId=b.MoId 
inner join Inventory c on a.InvCode=c.cInvCode
where CreateDate>'2018-12-31 00:00:00.000' and a.InvCode>'140000000' and MoClass=1 and a.InvCode not like '1460%' and a.InvCode <'1560000000'
