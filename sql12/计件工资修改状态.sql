

update sfc_pfreportdetail set PRdate=NULL where PFReportdId in

(select PFReportdId from sfc_pfreportdetail where pfreportid in


(select PFReportId from sfc_pfreport where  DocDate>'2019-05-25 00:00:00.000' and 
DocDate<'2019-06-26 00:00:00.000') and PRdate is not null)


select* from  sfc_pfreportdetail  a inner join sfc_pfreport b on a.pfreportid=b.pfreportid where prdate is not  null and b.DocDate>'2019-05-25 00:00:00.000' and 
b.DocDate<'2019-06-26 00:00:00.000'