--ȷ����û���ظ�
use UFDATA_003_2016
declare @icount int ,@discount int
set @icount=( select COUNT(*) icount from(select cInvCode from VenAndInv group by cInvCode,iSuppProperty) a)
set @discount=( select count(distinct cinvcode) from VenAndInv)

if @icount=@discount
	begin
		print 'һ��'+convert(nvarchar(20),@icount)+'�����룬���ظ���'
	end
else
	begin
		print 'һ��'+convert(nvarchar(20),@icount)+'�����룬�ظ�'+convert(nvarchar(20),(@icount-@discount))+'��'
	end


--select * from VenAndInv

--select cInvCode from VenAndInv group by cInvCode,iSuppProperty

--select distinct cinvcode from VenAndInv