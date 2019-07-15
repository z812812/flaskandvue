--select * from UFSystem.dbo.UA_Period
alter proc proc_zy_sumrdrecords01 as 

if  exists (select * from UFDATA_003_2016.dbo.sysobjects where name='zy_cgsum' )
	drop table zy_cgsum

create table zy_cgsum(
iyear nvarchar(500),
imonth nvarchar(500),
cvencode nvarchar(500),
cinvcode nvarchar(500),
cinvname nvarchar(500),
cinvstd nvarchar(500),
cinvaddcode nvarchar(500),
cptcode int,
iquantity nvarchar(500)
)

declare @today date =getdate()
declare @month varchar(10)=convert(int,substring(convert(varchar(20),@today,120),6,2))

declare @year varchar(10)=substring(convert(varchar(20),@today,120),1,4)
declare @dbegin date
declare @dend date
declare @count int 

--print(@month)
--print(@year)
declare @i int=1
while @i<=@month
	begin
	set @dbegin=(select dBegin from UFSystem.dbo.UA_Period where cAcc_Id='003' and iYear=@year and iId=@i)
	set @dend=(select dEnd from UFSystem.dbo.UA_Period where cAcc_Id='003' and iYear=@year and iId=@i)
	--print @dbegin
	--print @dend
	insert into zy_cgsum select @year,@i,  b.cVenCode,a.cInvCode,c.cInvName,c.cInvStd,c.cInvAddCode,b.cPTCode,SUM(a.iQuantity) iquantity from rdrecords01 a inner join		RdRecord01 b on a.ID=b.ID
	inner join inventory c on a.cInvCode=c.cInvCode
	where dDate between @dbegin and @dend
	--where dDate between '2019-1-1' and '2019-1-25'
	group by b.cVenCode,a.cInvCode,c.cInvName,c.cInvStd,c.cInvAddCode,b.cPTCode
	
	set @i=@i+1
	end
select * from zy_cgsum