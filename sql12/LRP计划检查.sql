--drop table zz

--exec  Usp_MP_MQ09002 ' WHERE 1=1  And  1=1   And ((p.InvCode >= N''102521102'') And (p.InvCode <= N''102521102''))','','tempdb..UFTmpTable_11164678533_5128028515031248615'

--select * from UFTmpTable_11164678533_5128028515031248615
if exists(SELECT [NAME] FROM sys.tables where name='zz') drop table zz


declare @l_str nvarchar(4000)
declare @v_DFCode nvarchar(4000)
declare @v_WhereString nvarchar(4000)
declare @v_TableName nvarchar(4000)

set @v_DFCode=''
set @v_WhereString=' WHERE 1=1  And  1=1   '
set @v_TableName='zz'

select @l_str = 'select s.PartId,s.DemType as DemType1,s.SoDId,p.InvCode, v.InvAddCode, v.InvName, v.InvStd,p.Free1 as cFree1,p.Free2 as cFree2,p.Free3 as cFree3,p.Free4 as cFree4,p.Free5 as cFree5,p.Free6 as cFree6,p.Free7 as cFree7, p.Free8 as cFree8,p.Free9 as cFree9,p.Free10 as cFree10,' +
                'v.InvDefine1 as cInvDefine1,v.InvDefine2 as cInvDefine2,v.InvDefine3 as cInvDefine3,v.InvDefine4 as cInvDefine4,v.InvDefine5 as cInvDefine5,v.InvDefine6 as cInvDefine6,v.InvDefine7 as cInvDefine7,v.InvDefine8 as cInvDefine8,v.InvDefine9 as cInvDefine9,v.InvDefine10 as cInvDefine10,' +
				'v.InvDefine11 as cInvDefine11,v.InvDefine12 as cInvDefine12,v.InvDefine13 as cInvDefine13,v.InvDefine14 as cInvDefine14,v.InvDefine15 as cInvDefine15,v.InvDefine16 as cInvDefine16,' +
                'Onhand = (select sum(ps.Onhand) from mps_lrpschedulepstock ps left join mps_datafilterdtl dt on ps.WhCode = dt.FRefCode and dt.FRefType = 4 left join mps_datafilter d on d.DFId = dt.DFId where ps.partid = lp.partid and (d.DFCode = ''' + @v_DFCode + ''' or ''' +  @v_DFCode + ''' = '''')),' +
				'(select sum(ps.inqty) from mps_lrpschedulepstock ps left join mps_datafilterdtl dt on ps.WhCode = dt.FRefCode and dt.FRefType = 4 left join mps_datafilter d on d.DFId = dt.DFId where ps.partid = lp.partid and (d.DFCode = ''' + @v_DFCode + ''' or ''' +  @v_DFCode + ''' = '''')) as inqty,' +
				'(select sum(ps.outqty) from mps_lrpschedulepstock ps left join mps_datafilterdtl dt on ps.WhCode = dt.FRefCode and dt.FRefType = 4 left join mps_datafilter d on d.DFId = dt.DFId where ps.partid = lp.partid and (d.DFCode = ''' + @v_DFCode + ''' or ''' +  @v_DFCode + ''' = '''')) as outqty,' + 
				'lp.SafeQty,s.DemDate,e2.EnumName as DemType,e1.EnumName as DocType,s.DocCode,s.DocSeq,e3.EnumName as OrgDemType,s.OrgDemCode,s.OrgDemSeq,v.ComUnitName,s.DocQty,(case when s.BalQty < 0 then 0 else s.BalQty end) as BalQty ' +
				' ,identity(int,1,1) as RowNo,s.OrgDemType as OrgDemType1,s.OrgDemDId,' +
				'p.InvCode as OrgDemInvCode, v.InvAddCode as OrgDemInvAddCode, v.InvName as OrgDemInvName, v.InvStd as OrgDemInvStd,' +
				'p.Free1 as OrgDemFree1,p.Free2 as OrgDemFree2,p.Free3 as OrgDemFree3,p.Free4 as OrgDemFree4,p.Free5 as OrgDemFree5,' +
				'p.Free6 as OrgDemFree6,p.Free7 as OrgDemFree7, p.Free8 as OrgDemFree8,p.Free9 as OrgDemFree9,p.Free10 as OrgDemFree10 ' +
				'into ' + @v_TableName + 
                ' from mps_lrpschedule s ' + 
                'inner join bas_part p on p.partid = s.partid ' +
                'inner join v_bas_inventory v On p.InvCode = v.InvCode ' +
                'inner join mps_lrpschedulepart lp on s.partid = lp.partid ' +
				'left join mps_netdemand n on s.DocType in (9,20) and s.DocDId = n.DemandId ' +
				'left join mps_planproject pp on n.Projectid = pp.Projectid ' +
				'left join mps_datafilterdtl dt on s.FRefType = dt.FRefType and (s.FRefCode = dt.FRefCode or dt.FRefCode is null) and (s.FRefId = dt.FRefId or dt.FRefId is null) ' +
				'left join mps_datafilter d on d.DFId = dt.DFId or pp.DFId = d.DFId	' +
                'left join v_aa_enum e1 on ((s.DemType not in (2,5)) and s.DemType = e1.EnumCode or s.DocType = 3 and s.Status = 2 and e1.EnumCode = 2 or s.DocType = 3 and s.Status = 3 and e1.EnumCode = 5 or s.DocType = 4 and s.Status = 2 and e1.EnumCode = 21 or s.DocType = 4 and s.Status = 3 and e1.EnumCode = 22) and e1.EnumType = ''MP.DemType'' ' +
                'left join v_aa_enum e2 on (s.DemType < 10 and e2.EnumCode = 1 or s.DemType > 10 and e2.EnumCode = 0) and e2.EnumType = ''MO.SupplyDemand'' ' +
                'left join v_aa_enum e3 on s.OrgDemType = e3.EnumCode and e3.EnumType = ''MO.DocType'' ' + @v_WhereString + ' order by s.PartId,s.DemDate ' 

exec (@l_str)
select @l_str = 'update ' + @v_TableName + 
' set OrgDemInvCode = '''', OrgDemInvAddCode = '''', OrgDemInvName = '''', OrgDemInvStd = '''',' +
'OrgDemFree1 = '''',OrgDemFree2 = '''',OrgDemFree3 = '''',OrgDemFree4 = '''',OrgDemFree5= '''',' +
'OrgDemFree6 = '''',OrgDemFree7 = '''',OrgDemFree8 = '''',OrgDemFree9 = '''',OrgDemFree10 = ''''' 
exec (@l_str)

select @l_str = 'update ' + @v_TableName +  
' set OrgDemInvCode = ' +
 '(case when t.orgdemtype1 = 1 then sod.cInvCode ' + 
	'when t.orgdemtype1 = 3 then exd.cInvCode ' +
	'when t.orgdemtype1 = 7 then md.InvCode ' +
	'when t.orgdemtype1 = 8 then omd.cInvCode ' +
	'when t.orgdemtype1 = 2 then p2.InvCode ' +
	'else '''' ' + 
	'end) ' + 
'from ' + @v_TableName + ' t ' +  
'left join SO_SODetails sod on t.OrgDemType1 = 1 and t.OrgDemDId = sod.iSOsID ' +
'left join mom_orderdetail md on t.OrgDemType1 = 7 and t.OrgDemDId = md.MoDId ' +
'left join om_modetails omd on t.OrgDemType1 = 8 and t.OrgDemDId = omd.MODetailsID ' + 
'left join ex_orderdetail exd on t.OrgDemType1 = 3 and t.OrgDemDId = exd.autoid ' +
'left join mps_forecastdetail fd on t.OrgDemType1 = 2 and t.OrgDemDId = fd.ForecastDId ' +
'left join bas_part p2 on fd.PartId = p2.PartId'
exec (@l_str)

select @l_str = 'update ' + @v_TableName + 
' set OrgDemInvAddCode = Inventory.cInvAddCode,' +
'OrgDemInvName = Inventory.cInvName, OrgDemInvStd = Inventory.cInvStd,' +
'OrgDemFree1 = p.Free1,OrgDemFree2 = p.Free2,OrgDemFree3 = p.Free3,OrgDemFree4 = p.Free4,OrgDemFree5 = p.Free5,'+
'OrgDemFree6 = p.Free5,OrgDemFree7 = p.Free7,OrgDemFree8 = p.Free8,OrgDemFree9 = p.Free9,OrgDemFree10 = p.Free10 ' +  
'from ' + @v_TableName + ' t ' + 
'inner join Inventory on t.OrgDemInvCode = Inventory.cInvCode ' +
'inner join bas_part p on t.OrgDemInvCode = p.InvCode'
exec (@l_str)

select a.*,b.*,case c.iPlanDefault when 1 then '自制' when 2 then '委外' when 3 then '采购' end,isnull(iquantity,0)+isnull(balqtyg,0)-isnull(balqtyx,0)-isnull(safeqty,0)   差距 from 
(select invcode,invaddcode,invname,invstd,safeqty,b.iquantity,demtype,SUM(balqty) balqtyg  from zz left join v_zy_LRPcurrentstock b on zz.invcode=b.cInvCode
where balqty<>0 and (invcode like'10%' or invcode like'11%' ) and demtype='供' 
group by invcode,invaddcode,invname,invstd,safeqty,b.iquantity,demtype) a left join 
(select invcode,demtype,SUM(balqty) balqtyx  from zz left join v_zy_LRPcurrentstock b on zz.invcode=b.cInvCode
where balqty<>0 and (invcode like'10%' or invcode like'11%' )  and demtype='需' 
group by invcode,demtype) b on a.invcode=b.invcode
left join inventory c on a.invcode=c.cInvCode

where isnull(iquantity,0)+isnull(balqtyg,0)-isnull(balqtyx,0)-isnull(safeqty,0) >=1000
	or isnull(iquantity,0)+isnull(balqtyg,0)-isnull(balqtyx,0)-isnull(safeqty,0) <=-1000


--or invcode like'14%' or invcode like'15%'

--select invcode,invaddcode,invname,invstd,onhand,safeqty,demtype,balqty from zz where invcode='100903208'


--select * from v_zy_LRPcurrentstock 


/*declare @a int
declare @b int
declare @c int
set @a =(select SUM(isnull(balqty,0)) from zz where demtype='供')
set @b =(select SUM(isnull(balqty,0)) from zz where demtype='需')
set @c=(select top 1 isnull(onhand,0) from zz)
print @a+@c-@b
print @a
print '---'
print @b
print '---'
print @c

*/