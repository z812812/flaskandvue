create view v_cgrkd as 
select a.cInvCode,MAX(b.dDate ) as cgdate from rdrecords01 a
                     left join RdRecord01 b on a.id=b.id
                     group by a.cInvCode 