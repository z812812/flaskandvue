create table zyMpState(
stateId int PRIMARY KEY IDENTITY(1,1),
billType int null,--1,采购，2，委外
ID varchar(50) null,
cVenState int null,--1，提交
cgState int null, --1，提交
otherState int null
)



drop table zyMpState

select * from zyMpState
delete  from zyMpState 

insert into zyMpState (ID,cVenState,cgState) values (1000174387,1,1)
select * from v_cgqk
