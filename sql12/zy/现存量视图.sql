create view v_currentstockzy as 
select cinvcode,SUM(iQuantity)as iquantity from currentstock where iquantity <>0 group by cInvCode 