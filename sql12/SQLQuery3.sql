select * into PU_PriceJustDetail20190329 from PU_PriceJustDetail


update a 
 set a.iTaxUnitPrice =b.��˰��,a.iUnitPrice =b.����,a.iTaxRate =b.˰��
 from PU_PriceJustDetail a,Sheet1$ b
 where a.invcode=b.�������  and a.cvencode =b.��Ӧ�̱���
