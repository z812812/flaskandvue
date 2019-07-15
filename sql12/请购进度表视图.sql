create view v_qgjdb
as
select  b.cCode as 请购单号,a.cInvCode as 物料编码,g.cInvAddCode as 存货代码,g.cInvName as 存货名称,
        g.cInvStd as 规格型号,a.fQuantity as 请购数量,b.dDate as 申请日期,a.cDefine37 as 需求日期,
        d.cPOID as 采购单号,c.cDefine36 as 到货日期,f.cCode as 入库单号,f.dDate as 入库日期 
from PU_AppVouchs  a inner join PU_AppVouch b on a.ID=b.ID
                                   left join PO_Podetails c on a.AutoID=c.iAppIds
                                   left join PO_Pomain d on c.POID=d.POID
                                   left join rdrecords01 e on c.ID=e.iPOsID
                                   left join rdrecord01  f on e.ID=f.ID
                                   inner join inventory g on a.cInvCode=g.cinvcode
                                   