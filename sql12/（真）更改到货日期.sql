declare @a nvarchar(50)
declare @b nvarchar(50)
declare @c date
declare @d nvarchar(50)
declare @cPOID nvarchar(50),@POIDs nvarchar(50),@dArriveDate date,@cInvCode nvarchar(50),
@cInvName nvarchar(50),@cInvStd nvarchar(50),@cBusType nvarchar(50),@cVenCode nvarchar(50),@tips nvarchar(500)

--�����α�
declare cur_zy cursor optimistic for 
 select a,b,c from zyschangeorderdate where a is not null
 
 --drop table Sheet2$
open cur_zy
fetch next from cur_zy into @a,@b,@c
while @@FETCH_STATUS=0
begin
	-- ��ѯƽ̨����ȡ��Ϣ
	select @cPOID=a.cPOID,@POIDs=a.POIDs,@dArriveDate=a.dArriveDate,@cInvCode=a.cInvCode,@cInvName=a.cInvName,@cInvStd=a.cInvStd,@cBusType=b.cBusType,@cVenCode=b.cVenCode 
	from kskf..PO_Podetails a left join kskf..PO_Pomain b on a.POID=b.POID 
	where a.cPOID=@a  and irowno=@b
	--ί�ⶩ���޸�
	if @cbustype= 'ί��ӹ�'
		begin
		--�ȸ�ERP
			update UFDATA_003_2016..OM_MODetails
			set dArriveDate=@c
			where MODetailsID=@POIDs
		--�ٸĹ�Ӧ��ƽ̨
			update kskf..PO_Podetails
			set dArriveDate=@c
			where POIDs=@POIDs
		--Ȼ�������Ϣ
		set	@tips='������룺'+@cInvCode+'��������ƣ�'+@cInvName+'������ͺţ�'+@cInvStd+'��ԭ�������ڣ�'+
					convert(nvarchar(50),@dArriveDate,23)+'�����Ϊ��'+ convert(nvarchar(50),@c,23)
			INSERT INTO [kskf].[dbo].[Messagets]([Content],[SendPerson],[SendTime],[SendDate],[cVenCode],[cState],[cPOID],[title],[iBillType],[AutoId],[cBusType])
			VALUES(@tips,'��Դ',GETDATE(),convert(varchar(50),GETDATE(),23),@cVenCode,0,@cPOID,'���ƻ��������ڱ����',0,0,@cBusType)
		end
	else
	--  ���Ĳɹ�����
		begin
			--�ȸ�ERP
			update UFDATA_003_2016..po_podetails
			set dArriveDate=@c
			where ID=@POIDs
		--�ٸĹ�Ӧ��ƽ̨
			update kskf..PO_Podetails
			set dArriveDate=@c
			where POIDs=@POIDs
		--Ȼ�������Ϣ
		set	@tips='������룺'+@cInvCode+'��������ƣ�'+@cInvName+'������ͺţ�'+@cInvStd+'��ԭ�������ڣ�'+
					convert(nvarchar(50),@dArriveDate,23)+'�����Ϊ��'+ convert(nvarchar(50),@c,23)
			INSERT INTO [kskf].[dbo].[Messagets]([Content],[SendPerson],[SendTime],[SendDate],[cVenCode],[cState],[cPOID],[title],[iBillType],[AutoId],[cBusType])
			VALUES(@tips,'��Դ',GETDATE(),convert(varchar(50),GETDATE(),23),@cVenCode,0,@cPOID,'���ƻ��������ڱ����',0,0,@cBusType)
		end
	fetch next from cur_zy into @a,@b,@c

end
close cur_zy
deallocate cur_zy

