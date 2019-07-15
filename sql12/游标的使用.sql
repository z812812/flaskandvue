declare @cinvcode nvarchar(50)
declare @vendorname nvarchar(50)
declare @id nvarchar(50)

--定义游标
declare cur_zy cursor optimistic for 
 select top 5 cinvcode,cpoid from rdrecords01

open cur_zy
fetch next from cur_zy into @cinvcode,@vendorname
while @@FETCH_STATUS=0
begin
if @vendorname like 'ww%'
    begin
print ''
print '-------------------'
print @cinvcode+' 委外 '+@vendorname
fetch next from cur_zy into @cinvcode,@vendorname
    end
else
   
    begin
print ''
print '-------------------'
print @cinvcode+' 采购 '+@vendorname
fetch next from cur_zy into @cinvcode,@vendorname
    end
    
    
end
close cur_zy
deallocate cur_zy