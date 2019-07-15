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
--���ϳ��ⵥ
alter TRIGGER rdrecords11_zy 
   ON  rdrecords11
   for insert
   
AS 
declare @time date
set @time=GETDATE()
exec OM_SP_GetCLYE N'TEMPDB..TMPUF_265336205_heron1125795190_ZY',@time,@time,N'',N' 1=1',N' 1=1',N' 1=1',N' 1=1'


declare @cvencode int --��Ӧ�̱���
declare @num float --���ϳ��ⵥ��������
declare @benum float --�涨��������
declare @crdcode int --�շ���� 203 ί�ⷢ��
declare @nownum float --���ڵ�����
set @cvencode=(select top 1 cvencode from inserted a inner join rdrecord11 b with(nolock) on a.id=b.ID)
set @num=(select SUM(iquantity) from inserted )
set @nownum=(select  sum(���ڽ���_����) from TEMPDB..TMPUF_265336205_heron1125795190_ZY  where ��Ӧ�̱���=@cvencode)
set @benum=(select iEmployeeNum from Vendor where cVenCode=@cvencode)
set @crdcode=(select top 1 b.cRdCode from inserted a inner join rdrecord11 b with(nolock) on a.id=b.ID)
--insert into temp_zy111 (a,b,c) values (@num,@nownum,@benum)
if 
@crdcode=203 and isnull(cast(@num as int),0)+isnull(cast(@nownum as int),0)>isnull(cast(@benum as  int ),0)
BEGIN
	
	RAISERROR('�ù�Ӧ�̷�������',16,1)
	rollback

    -- Insert statements for trigger here

END
GO
