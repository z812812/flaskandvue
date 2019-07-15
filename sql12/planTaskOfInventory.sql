declare @cinvcode nvarchar(100),@i int =0 ,@iPlanDefault nvarchar(100),@cVenCode nvarchar(100)


declare zy_cur cursor optimistic for
	select cInvCode,iPlanDefault,cVenCode from inventory where cInvCode between '100000000' and '12000000' and dEDate is  null
	
open zy_cur

fetch next from zy_cur into @cinvcode,@iPlanDefault,@cVenCode

while @@FETCH_STATUS =0
	BEGIN
	print @cinvcode+'-->'+isnull(@iPlanDefault,'no plan')+'-->'+isnull(@cVenCode,'no cven')
	set @i=@i+1
	print @i
	fetch next from zy_cur into @cinvcode,@iPlanDefault,@cVenCode
	END
close zy_cur
deallocate zy_cur