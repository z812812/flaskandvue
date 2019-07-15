

--select * from zy_inventory


--select a.cinvcode,cinvname,cinvstd,cinvaddcode,b.cz,b.detail from inventory a left join zy_inventory b on a.cInvCode=b.cinvcode where cInvCCode like '100104%' order by cinvcode

select a.cinvcode,cinvname,cinvstd,cinvaddcode,b.cz,b.detail from inventory a left join (select cinvcode,cz,detail from(select row_number() over(partition by cinvcode order by id) as rownum , * from zy_inventory) as T where T.rownum = 1) b on a.cInvCode=b.cinvcode where a.cInvCode='100705102'


insert into zy_inventory (cinvcode,cz,detail,createuser,createtime) values ('103001103','20nimo','想手机的房价快速地发挥尽快答复后即可发货健康增加','14322',GETDATE())


select top 1 * from zy_inventory a where cinvcode='103001103' order by id desc


select  b.id,a.cinvcode,cinvname,cinvstd,cInvaddcode,cz,detail,createuser,createtime from inventory a left join zy_inventory b on a.cinvcode=b.cinvcode
where a.cInvCode = '103001103'
order by b.id desc


select id,cinvcode,cz from zy_inventory group by cinvcode,cz,id having id=MAX(id)

select cinvcode,cz from
(select row_number() over(partition by cinvcode order by id) as rownum 
, * from zy_inventory
) as T where T.rownum = 1

select a.cinvcode,cinvname,cinvstd,cinvaddcode,b.cz,b.detail from inventory a 
          left join (select cinvcode,cz,detail from(select row_number() over(partition by cinvcode order by id) as rownum ,
           * from zy_inventory) as T where T.rownum = 1) b on a.cInvCode=b.cinvcode 
          where cInvCCode like '100101%' order by cinvcode
          
          
          
select a.cinvcode,cinvname,cinvstd,cinvaddcode,b.cz,b.detail from inventory a left join (select cinvcode,cz,detail from(select row_number() over(partition by cinvcode order by id) as rownum , * from zy_inventory) as T where T.rownum = 1) b on a.cInvCode=b.cinvcode where a.cInvCode='100101102'        