create view v_zy_wwhx
as 
--delete from  zy_rd01

--insert into zy_rd01 select autoid,iomodid  from rdrecords01 where iOMoDID is not null

--insert into zy_rd01 select autoid,iomodid  from rdrecords11 where iOMoDID is not null


select c.cCode,c.dDate, c.cMaker from OM_MatSettleVouchs a inner join zy_rd01  b on a.irdsid=b.autoid
                                   inner join OM_MatSettleVouch c on a.MSID=c.MSID
where c.dDate>'2018-9-25 00:00:00:000'
group by c.cCode,c.dDate,c.cMaker

having min(convert(bigint,b.iomodid))<>max(convert(bigint,b.iomodid))

select * from v_zy_wwhx