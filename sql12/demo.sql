--select b.cPOID,a.dArriveDate,dateadd(DD,6,GETDATE()) darr,a.cSource,a.cDefine32,* from po_podetails a inner join po_pomain b on a.POID=b.POID 
--where b.cPOID='CG19050003'


--select cinvcode,iInvAdvance  from ufdata_003_2016..inventory 


-- s.DocDate >=dateadd(dd,-45,getdate())  
 
-- declare @now date
-- set @now=DATEADD(DD,5,GETDATE())
-- print @now
 
-- update po_podetails
-- set dArriveDate=dateadd(DD,6,GETDATE())
-- where id='1000174817'
 
 --select * from v_bas_calendar_sys where  CalDate>=GETDATE() order by caldate
-- select * from po_podetails  where id='1000174817'
 
 declare @caldate date,@wkhours int,@seq int
 
 set @caldate=convert(date,dateadd(DD,4,GETDATE()))
 
 set @caldate=(select CalDate from v_bas_calendar_sys where CalDate= @caldate )
  set @wkhours=(select wkhours from v_bas_calendar_sys where CalDate= @caldate )
   set @seq=(select seq from v_bas_calendar_sys where CalDate= @caldate )
 
 print @caldate
 print @wkhours
 print @seq
 print '--------------------------'
 if @wkhours=0
	begin
	set @caldate=(select top 1 CalDate from v_bas_calendar_sys where Seq=@seq+1 order by WkHours desc)
	end
	
 print @caldate 
