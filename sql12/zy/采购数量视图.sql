create view v_cgsl as 
select a.cinvcode, a.iQuantity as cgsl,b.iquantity as rksl,a.iQuantity-b.iquantity as wrksl from po_podetails a 
                     inner join v_rdrecords01 b on a.ID=b.iposid
where a.iQuantity-b.iquantity<>0 and a.cbCloser<>''
                     
create view v_cgsl1 as 
select a.cinvcode, a.iQuantity as cgsl,b.iquantity as rksl,a.iQuantity-b.iquantity as wrksl from OM_MODetails a 
                     inner join v_rdrecords011 b on a.MODetailsID=b.iOMoDID
where a.iQuantity-b.iquantity<>0 and a.cbCloser<>''
                     