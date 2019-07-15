alter view v_jgb
as 
select  (case jgb.iSupplyType when 1 then '采购' when 2 then '委外' end) as 供应类型
         ,jgb.cVenCode as 供应商编码,gysda.cVenName as 供应商名称, jgb.cInvCode as  存货编码,chda.cInvAddCode as 存货代码,
        chda.cinvname as 存货名称,chda.cInvStd as 规格型号,  tjdz.iTaxRate as 税率,jgb.iUnitPrice as 原币单价,jgb.iTaxUnitPrice as 含税单价,
		tjdz.cbodymemo as 表体备注, tjdz.cdefine29 as 材料, tjdz.dstartdate as 生效日期, tjdz.denddate as 失效日期,
		tjd.ddate as 制单日期, tjd.cmaker as 制单人,tjd.ccode as 调价单号,tjdkz.cbdefine15 as 单价小计不含材料不含税,
		tjdkz.cbdefine28 as 含材料单价如果含材料参考不含税,tjdkz.cbdefine16 as 备注,tjdkz.cbdefine27 as 材料价格 ,tjdkz.cbdefine2 as 重量定额,tjdkz.cbdefine3 as 锻造单价,
		tjdkz.cbdefine20 as 锻单价合计,tjdkz.cbdefine18 as 正火重量定额,tjdkz.cbdefine4 as 正火单价,tjdkz.cbdefine21  as 正火价格,
		tjdkz.cbdefine5 as 抛丸单价,tjdkz.cbdefine22 as 抛丸价格,
		
		tjdkz.cbdefine6 as 精车单价,tjdkz.cbdefine1 as 粗车单价,tjdkz.cbdefine7 as 车单价,
		tjdkz.cbdefine8 as 转孔单价,tjdkz.cbdefine9 as 攻丝单价,tjdkz.cbdefine10 as 铣单价,
		tjdkz.cbdefine19 as 调质重量定额,tjdkz.cbdefine11 as 调质单价,tjdkz.cbdefine23 as 调质价格,tjdkz.cbdefine12 as 调后抛丸单价,
		tjdkz.cbdefine24 as 调后抛丸价格,tjdkz.cbdefine13 as 渗碳单价,
		tjdkz.cbdefine25 as 渗碳价格,tjdkz.cbdefine14 淬火单价,tjdkz.cbdefine26 as 淬火价格,tjdkz.cbdefine30 as 热处理抛丸价格,tjdkz.cbdefine31 as 其他价格
from Ven_Inv_Price jgb
     inner join PU_PriceJustDetail tjdz on tjdz.autoid=jgb.ipriceautoid
     inner join PU_PriceJustDetail_extradefine tjdkz on tjdkz.autoid=tjdz.autoid
     inner join PU_PriceJustMain tjd on tjd.id=tjdz.id 
     inner join Inventory chda on chda.cInvCode=jgb.cInvCode
     inner join Vendor gysda on gysda.cVenCode=jgb.cVenCode