create view v_currentxcl as
select cInvCode ,SUM(iQuantity) as iquantity from currentstock where iquantity>0 group by cInvCode having cInvCode not like '15%' and cInvCode not like '14%' 