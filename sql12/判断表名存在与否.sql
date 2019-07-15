if OBJECT_ID('Sheet1$') is not null 
	drop table Sheet1$
if OBJECT_ID('Sheet2$') is not null 
	drop table Sheet2$
	
select name from UFDATA_003_2016..sysobjects where name='venandinv'

select OBJECT_ID('venandinv')