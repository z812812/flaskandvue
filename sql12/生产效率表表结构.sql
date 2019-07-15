--[proc_zy_momorder] 5

--create table t_zy_momorderOfTime (
--id int primary key identity(1,1),
--MDeptCode nvarchar(50),
--cdepname nvarchar(50),
--sumNum int,
--okNum int ,
--qtyOfOkIn int,
--qtyOfAll int,
--qtyOfIn int
--)

--MDeptCode,cdepname,sumNum,okNum,qtyOfOkIn,qtyOfAll,qtyOfIn


select id,MDeptCode 部门编码,cdepname 部门名称, 
substring(cast((cast(isnull(okNum,0) as float)/cast(sumNum as float))*100 as nvarchar),1,5)+'%' 下达及时率 ,
substring(cast((cast(isnull(qtyOfOkIn,0) as float)/cast(qtyOfAll as float))*100 as nvarchar),1,5)+'%' 入库及时率 ,
substring(cast((cast(isnull(qtyOfIn,0) as float)/cast(qtyOfAll as float))*100 as nvarchar),1,5)+'%' 延期入库率 ,

sumNum 生产订单数量,okNum 按时下达订单数量,qtyOfOkIn 正常入库数量,
qtyOfAll 订单数量,qtyOfIn 延期后入库数量
from t_zy_momorderOfTime