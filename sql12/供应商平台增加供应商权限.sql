--select UserId from Base_User where DepartmentId  in ('427ce725-971a-4568-bd58-6d24e83b709b','a7330f70-44af-4af7-9dd8-37885f58a0ea','1ce887a5-d50f-4032-8d86-33a62c1f43b3','b8947bf5-1263-4e12-8818-428a32f10497')

----select * from Base_Department
use kskf
declare @cvencode nvarchar(100),@userid nvarchar(100)

set @cvencode='02044'
declare cur_zy cursor optimistic for 
	select UserId from Base_User where DepartmentId  in ('427ce725-971a-4568-bd58-6d24e83b709b','a7330f70-44af-4af7-9dd8-37885f58a0ea',
	'1ce887a5-d50f-4032-8d86-33a62c1f43b3','b8947bf5-1263-4e12-8818-428a32f10497')

open cur_zy
fetch next from cur_zy into @userid
while @@FETCH_STATUS=0
begin
	insert into dbo.VendorByUser (UserID,VendorID) values (@userid,@cvencode)
	fetch next from cur_zy into @userid

end
close cur_zy
deallocate cur_zy