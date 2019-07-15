alter view v_price as 
select ch.cInvCode as 存货编码,ch.cInvAddCode as 存货代码,ch.cInvName as 存货名称,ch.cInvStd as 规格型号,
                   (case ch.bPurchase when 1 then '是' when 0 then '否' end) as 是否采购,(case ch.bProxyForeign  when 1 then '是' when 0 then '否' end)as 是否委外,
                   jg.cVenCode as 供应商编码,gys.cVenName as 供应商名称,jg.iUnitPrice as 无税单价,jg.iTaxUnitPrice as 含税单价,jg.iTaxRate as 税率,
                   jg.dEnableDate as 生效日期,jg.dDisableDate as 失效日期
                   from inventory ch 
                   left join Ven_Inv_Price jg on ch.cInvCode=jg.cInvCode
                   left join Vendor gys on jg.cVenCode=gys.cVenCode
                  