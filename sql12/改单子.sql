--根据材料出库单号改出库部门
use UFDATA_003_2016
update rdrecord11 set cDepCode='22' where ccode='1801E03059'
--根据调拨单号改转出部门和转入部门
use UFDATA_003_2016
update TransVouch set cODepCode='转出部门编码 ',cIDepCode='转入部门编码 ' where cTVCode='库存调拨单号 '

--根据其他出库单号改出库类别
use UFDATA_003_2016
update RdRecord09 set crdcode='209' where ccode='1802F01330'

--根据领料申请单单号改出库部门
use UFDATA_003_2016
update MaterialAppVouch set cDepCode='6631' where ccode='1801K00029'


--根据材料出库单号改出库类别
use UFDATA_003_2016
update rdrecord11 set crdcode='216' where ccode='1805e07971'

--根据完工单号改单据日期
use UFDATA_003_2016
update sfc_pfreport set DocDate='2017-12-01' where DocCode='1710034153'

--根据其他出库单号改出库部门
use UFDATA_003_2016
update RdRecord09 set cDepCode='6624' where ccode='1801F00382'

--根据调拨单号改出库类别和入库类别
use UFDATA_003_2016
update TransVouch set cIRdCode='209',cORdCode='108'where cTVCode='1802G00523'

