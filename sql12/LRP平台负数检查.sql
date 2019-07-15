select i.cInvCode
	from mps_netdemand n inner join mps_planproject p on n.ProjectId = p.ProjectId 
	inner join mps_plancode c on p.PlanCodeId = c.PlanCodeId
	inner join bas_part b on b.PartId = n.PartId inner join inventory i on b.Invcode = i.cInvCode
	where p.ActiveFlag = 1 and n.SupplyType<>7 and n.DelFlag = 0
	
	and n.PlanQty-n.CrdQty<0  and n.Status<>4 and SupplyType=3