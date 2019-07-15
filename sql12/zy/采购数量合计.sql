create view v_sumcg as 
select cinvcode, SUM(cgsl) as cgsl,SUM(rksl) as rksl,SUM(wrksl) as wrksl from v_cgsl group by cinvcode

create view v_sumww as 
select cinvcode, SUM(cgsl) as cgsl,SUM(rksl) as rksl,SUM(wrksl) as wrksl from v_cgsl1 group by cinvcode