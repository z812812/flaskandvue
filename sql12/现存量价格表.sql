alter view v_xclprice as 
select d.cgdate as 最新入库日期,e.cldate as 材料出库最新日期,f.cldate as 其他出库日期, a.cinvcode as 存货编码,b.cInvAddCode as 存货代码,b.cInvName as 存货名称,b.cInvStd as 规格型号,a.iquantity as 现存数量,
                 case b.bPurchase when 1 then '是' else '否' end as 是否采购, case b.bProxyForeign when 1 then '是' else '否' end as 是否委外,case b.bSelf when 1 then '是' else '否' end as 是否自制,
                 c.cVenCode as 供应商编码,c.cVenName as 供应商名称,p.iTaxRate as 税率,iUnitPrice as 无税单价,iTaxUnitPrice as 含税单价,p.dEnableDate as 生效日期,p.dDisableDate as 失效日期 
                 from v_currentxcl a
                 left join ven_inv_price p on a.cinvcode=p.cinvcode 
                 inner join inventory b on b.cInvCode=a.cinvcode
                 left join Vendor c on c.cVenCode = p.cVenCode
                 left join v_cgrkd d on d.cinvcode=a.cinvcode
                 left join v_clck e on e.cinvcode=a.cInvCode
                 left join v_qtck f on f.cinvcode=a.cInvCode
              
              