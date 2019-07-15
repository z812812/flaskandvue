create view v_rdrecords01 as
select iPOsID,SUM(iQuantity) as iquantity from rdrecords01 where iPOsID<>0 group by iPOsID

create view v_rdrecords011 as
select iOMoDID,SUM(iQuantity) as iquantity from rdrecords01 where iOMoDID<>0 group by iOMoDID