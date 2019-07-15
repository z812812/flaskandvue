--select top 100 iInvAdvance ,* from inventory



declare @cinvcode nvarchar(50)
declare @b nvarchar(50)
declare @c nvarchar(50)
declare @d nvarchar(50)

--定义游标
declare cur_zy cursor optimistic for 
 select a,b,c from Sheet1$
open cur_zy
fetch next from cur_zy into @cinvcode,@b,@c
while @@FETCH_STATUS=0
begin
	--select * from VenAndInv where cveninvcode is not null
	--select * from inventory where cinvcode like '10%'
	update inventory
	set cInvDefine2=@b
	where cInvCode = convert(nvarchar(50),@cinvcode)
	--print(convert(nvarchar(50),@cinvcode)+'======='+@type+'---------'+@isu)
	fetch next from cur_zy into @cinvcode,@b,@c

end
close cur_zy
deallocate cur_zy