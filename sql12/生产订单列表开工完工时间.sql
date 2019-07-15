alter view  v_zy_mom_orderqingkuang as 
select mocode as 订单号,SortSeq as 行号,a.InvCode as 存货编码,c.cInvAddCode as 存货代码,c.cInvName as 存货名称 ,c.cInvStd as 规格型号,Qty as 订单数量,QualifiedInQty as 完工数量,Qty-QualifiedInQty as 未完成数量,CreateDate as 创建时间,CloseDate as 关闭时间 from mom_orderdetail a inner join mom_order  b on a.MoId=b.MoId 
inner join Inventory c on a.InvCode=c.cInvCode
where CreateDate>'2018-12-31 00:00:00.000' and a.InvCode>'140000000' and MoClass=1 and a.InvCode not like '1460%' and a.InvCode <'1560000000'
