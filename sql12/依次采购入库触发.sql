-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter TRIGGER T_rdrecords01_yiciruku
   ON  rdrecords01
   for insert
   
AS 

declare @cinvcode nvarchar(50)

declare @vendorname nvarchar(50)
declare @poid nvarchar(50)
declare @omid nvarchar(50)
declare @poidforinserted nvarchar(50)
declare @omidforinserted nvarchar(50)

--�����α�
declare cur_zy cursor optimistic for 
 select  cinvcode,chVencode,isnull(min(iPOsID),0) as poid,isnull(min(iOMoDID),0) as omid from inserted  group by cinvcode,chvencode

open cur_zy
fetch next from cur_zy into @cinvcode,@vendorname,@poid,@omid
--v_cgwwc��ͼ�����л�δ���Ĳɹ���������� ID��������룬���� ��3��
--v_wwwwc��ͼ�����л�δ����ί�ⶩ������� ID��������룬���� ��3��
print @cinvcode+' '+@vendorname+'   '+@poid+'  '+@omid

set @poidforinserted=isnull((select top 1 id from v_cgwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
set @omidforinserted=isnull((select top 1 modetailsid from v_wwwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
while @@FETCH_STATUS=0
begin
--����Ǹ��ݲɹ����������鿴���Ĳɹ������������ǲ������вɹ�����δ�������е���СID������ʲô�����������Ǿ��׳��쳣���ع���
--�����ί�ⶩ��������ѯί����ͼ��
   if (@poid<>0 and @poid<>@poidforinserted)
         begin
			 print @poidforinserted+'  '+@poid
             RAISERROR('��ѡ������Ĳɹ��������',16,1)
	         rollback
	     end
   /*if (@omid<>0 and @omid<>@omidforinserted)
        begin
             RAISERROR('��ѡ�������ί�ⶩ�����',16,1)
	         rollback  
         end
    */
         
fetch next from cur_zy into @cinvcode,@vendorname,@poid,@omid
set @poidforinserted=isnull((select top 1 id from v_cgwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
set @omidforinserted=isnull((select top 1 modetailsid from v_wwwwc where cinvcode=@cinvcode and cVenCode=@vendorname),0)
end

close cur_zy
deallocate cur_zy



/*
if 
@a=1
BEGIN

	RAISERROR('�ù�Ӧ����ʱֹͣ�ɹ�',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
*/