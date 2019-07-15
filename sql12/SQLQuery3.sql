select * into PU_PriceJustDetail20190329 from PU_PriceJustDetail


update a 
 set a.iTaxUnitPrice =b.含税价,a.iUnitPrice =b.单价,a.iTaxRate =b.税率
 from PU_PriceJustDetail a,Sheet1$ b
 where a.invcode=b.存货编码  and a.cvencode =b.供应商编码
