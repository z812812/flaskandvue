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


select id,MDeptCode ���ű���,cdepname ��������, 
substring(cast((cast(isnull(okNum,0) as float)/cast(sumNum as float))*100 as nvarchar),1,5)+'%' �´Ｐʱ�� ,
substring(cast((cast(isnull(qtyOfOkIn,0) as float)/cast(qtyOfAll as float))*100 as nvarchar),1,5)+'%' ��⼰ʱ�� ,
substring(cast((cast(isnull(qtyOfIn,0) as float)/cast(qtyOfAll as float))*100 as nvarchar),1,5)+'%' ��������� ,

sumNum ������������,okNum ��ʱ�´ﶩ������,qtyOfOkIn �����������,
qtyOfAll ��������,qtyOfIn ���ں��������
from t_zy_momorderOfTime