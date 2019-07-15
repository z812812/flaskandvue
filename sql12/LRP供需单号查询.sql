select * from mps_netdemand where PlanCode='GEN001451877'

select InvCode,b.cInvName,b.cInvStd from bas_part a inner join inventory b on a.InvCode=b.cInvCode where PartId='316'