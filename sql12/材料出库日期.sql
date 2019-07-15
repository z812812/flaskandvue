alter view v_clck as
select cInvCode,max(b.dDate) as cldate from rdrecords11 a left join RdRecord11 b on a.id=b.ID group by cInvCode having cinvcode not like '15%' and cinvcode not like '14%'

--alter view v_qtck as
--select cInvCode,max(b.dDate) as cldate from rdrecords09 a left join RdRecord09 b on a.id=b.ID
 --group by cInvCode having cinvcode not like '15%' and cinvcode not like '14%'