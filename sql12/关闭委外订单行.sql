update OM_MODetails
set cbCloser='asusre'
where dStartDate<'2018-06-01 00:00:00:000' and isnull(dbCloseDate,0)=0