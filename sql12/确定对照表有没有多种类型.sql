--确定有没有重复
use UFDATA_003_2016
declare @icount int ,@discount int
set @icount=( select COUNT(*) icount from(select cInvCode from VenAndInv group by cInvCode,iSuppProperty) a)
set @discount=( select count(distinct cinvcode) from VenAndInv)

if @icount=@discount
	begin
		print '一共'+convert(nvarchar(20),@icount)+'条编码，无重复项'
	end
else
	begin
		print '一共'+convert(nvarchar(20),@icount)+'条编码，重复'+convert(nvarchar(20),(@icount-@discount))+'条'
	end


--select * from VenAndInv

--select cInvCode from VenAndInv group by cInvCode,iSuppProperty

--select distinct cinvcode from VenAndInv