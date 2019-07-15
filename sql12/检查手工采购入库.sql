select cDefine14 ,dnmaketime,cMaker,cCode,cVenCode from rdrecord11 where dDate>='2019-5-22' and cBusType='委外发料' and isnull(cDefine14,'')<>'Y' 
order by dnmaketime desc


select rd.cdefine14,rd.dnmaketime, rd.cCode as '订单号',rd.cVenCode as '供应商编码',rd.dDate as '单据日期',rd.cMaker as '制单人',rds.cinvcode as '存货编码',c.cInvName from rdrecord01 rd (nolock)
left join rdrecords01 rds (nolock) on rd.id=rds.id
left join inventory c on rds.cInvCode=c.cInvCode
 where --isnull(rd.cDefine14,'')<>'Y' --and rd.ddate>='2019-05-7'
  (rds.cinvcode like '10%' or rds.cInvCode like '11%') 
 and rd.cCode='1905A02494'

 order by dnmaketime desc
 


select cRdCode,* from rdrecord11 where cBusType='委外发料' and isnull(cRdCode,'')<>'203'

select * from Rd_Style


select fSupplyMulti from inventory where cInvCode='170301005'


