/*create view v_cgwwc as
select min(a.id) as id,b.cVenCode,c.cInvCode from 
(select zpurpoheader.poid,zpurpotail.id
FROM  zpurpoheader with (nolock) 
inner join zpurpotail with (nolock) on zpurpoheader.poid=zpurpotail.poid  
LEFT JOIN  (select cInvCode as cInvCode1,bService ,iID,imassdate,cMassUnit,binvtype from Inventory with (nolock) ) Inventory ON zpurpotail.cInvCode = Inventory.cInvCode1  
left join (select cinvsubcode,iexpiratdatecalcu from inventory_sub) inventory_sub on zpurpotail.cInvCode = Inventory_sub.cinvsubcode  
left join (select cbdefine29 as cbdefine29,id as keyextend_b_id_po_podetails_extradefine_id from po_podetails_extradefine) extend_b_id_po_podetails_extradefine on keyextend_b_id_po_podetails_extradefine_id=zpurpotail.id  
 Where ( (1>0) AND (1>0) ) AND ( 1=1   ) and (isnull(cbustype,'')<>'委外加工') and  ((case when isnull(cchanger,N'') <> N'' then isnull(cchangverifier ,N'') else isnull(cverifier,N'') end) <> N'' 
and isnull(cbcloser,N'')=N''  and isnull(cbustype,N'')<>N'直运采购')  and isnull(Inventory.bService,0) <>1 and isnull(inventory.binvtype,0)=0  and  isnull(bGsp,0)=0 AND   isnull(iArrQTY,0)=0 
and  isnull(iArrNUM,0)=0  and  isnull(bstorageorder,1)=1  and (  ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)) >0 or (igrouptype=2 
and (ABS(ISNULL(iNum,0))-ABS(ISNULL(iReceivedNum,0))) >0 )) 
and 1=1) a left join PO_Pomain b on a.poid=b.POID 
left join PO_Podetails c on a.id=c.ID
group by c.cInvCode,b.cVenCode
*/
select * from v_cgwwc




--委外表头
/*
select distinct top 100 percent om_mohead.moid FROM  om_mohead with (nolock) 
inner join om_mobody with (nolock) on om_mohead.moid=om_mobody.moid  
LEFT JOIN  (select cInvCode as cInvCode1,bService,iID,ISNULL(cdefwarehouse,'') as cdefwarehouse from Inventory) Inventory ON om_mobody.cInvCode = Inventory.cInvCode1  
left join (select cwhcode,cwhname from warehouse with (nolock) ) w  on isnull(w.cwhcode,N'')=Inventory.cdefwarehouse  
left join (select cbdefine32 as cbdefine32,cbdefine33 as cbdefine33,modetailsid as keyextend_b_modetailsid_om_modetails_extradefine_modetailsid from om_modetails_extradefine) extend_b_modetailsid_om_modetails_extradefine on keyextend_b_modetailsid_om_modetails_extradefine_modetailsid=om_mobody.modetailsid  
 Where ( (1>0) AND (1>0) ) AND ( 1>0 ) AND (ISNULL(CBUSTYPE,'')='委外加工') and  ((case when isnull(cchanger,N'') <> N'' then isnull(cchangeverifier ,N'') else isnull(cverifier,N'') end) <> N'' and isnull(cbcloser,N'')=N'' and isnull(cbustype,N'')<>N'直运采购')  
and isnull(Inventory.bService,0) <>1  and  isnull(bGsp,0)=0 AND   isnull(iArrQTY,0)=0 and  isnull(iArrNUM,0)=0   
AND (case when  igrouptype<>2 then ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)) else (case when not( (ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)))<=0 
and (ABS(ISNULL(iNum,0))-ABS(ISNULL(iReceivedNum,0)))<=0) then 1 else 0 end) end )>0  and 1=1
*/
/*alter view v_wwwwc as
select a.cinvcode,min(a.modetailsid) as modetailsid,c.cVenCode from
(select cinvcode,modetailsid FROM  om_mohead with (nolock) inner join om_mobody with (nolock) on om_mohead.moid=om_mobody.moid  LEFT JOIN  (select cInvCode as cInvCode1,bService,iID,ISNULL(cdefwarehouse,'') as cdefwarehouse from Inventory) Inventory ON om_mobody.cInvCode = Inventory.cInvCode1  left join (select cwhcode,cwhname from warehouse with (nolock) ) w  on isnull(w.cwhcode,N'')=Inventory.cdefwarehouse  left join (select cbdefine32 as cbdefine32,cbdefine33 as cbdefine33,modetailsid as keyextend_b_modetailsid_om_modetails_extradefine_modetailsid from om_modetails_extradefine) extend_b_modetailsid_om_modetails_extradefine on keyextend_b_modetailsid_om_modetails_extradefine_modetailsid=om_mobody.modetailsid   Where ( (1>0) AND (1>0) ) AND ( 1>0 ) AND (ISNULL(CBUSTYPE,'')='委外加工') and  ((case when isnull(cchanger,N'') <> N'' then isnull(cchangeverifier ,N'') else isnull(cverifier,N'') end) <> N'' and isnull(cbcloser,N'')=N'' and isnull(cbustype,N'')<>N'直运采购')  and isnull(Inventory.bService,0) <>1  and  isnull(bGsp,0)=0 AND   isnull(iArrQTY,0)=0 and  isnull(iArrNUM,0)=0   AND (case when  igrouptype<>2 then ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)) else (case when not( (ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)))<=0 and 
(ABS(ISNULL(iNum,0))-ABS(ISNULL(iReceivedNum,0)))<=0) then 1 else 0 end) end )>0  and 1=1 and om_mohead.moid in (select distinct top 100 percent om_mohead.moid FROM  om_mohead with (nolock) 
inner join om_mobody with (nolock) on om_mohead.moid=om_mobody.moid  
LEFT JOIN  (select cInvCode as cInvCode1,bService,iID,ISNULL(cdefwarehouse,'') as cdefwarehouse from Inventory) Inventory ON om_mobody.cInvCode = Inventory.cInvCode1  
left join (select cwhcode,cwhname from warehouse with (nolock) ) w  on isnull(w.cwhcode,N'')=Inventory.cdefwarehouse  
left join (select cbdefine32 as cbdefine32,cbdefine33 as cbdefine33,modetailsid as keyextend_b_modetailsid_om_modetails_extradefine_modetailsid from om_modetails_extradefine) extend_b_modetailsid_om_modetails_extradefine on keyextend_b_modetailsid_om_modetails_extradefine_modetailsid=om_mobody.modetailsid  
 Where ( (1>0) AND (1>0) ) AND ( 1>0 ) AND (ISNULL(CBUSTYPE,'')='委外加工') and  ((case when isnull(cchanger,N'') <> N'' then isnull(cchangeverifier ,N'') else isnull(cverifier,N'') end) <> N'' and isnull(cbcloser,N'')=N'' and isnull(cbustype,N'')<>N'直运采购')  
and isnull(Inventory.bService,0) <>1  and  isnull(bGsp,0)=0 AND   isnull(iArrQTY,0)=0 and  isnull(iArrNUM,0)=0   
AND (case when  igrouptype<>2 then ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)) else (case when not( (ABS(ISNULL(iQuantity,0))-ABS(ISNULL(iReceivedQTY,0)))<=0 
and (ABS(ISNULL(iNum,0))-ABS(ISNULL(iReceivedNum,0)))<=0) then 1 else 0 end) end )>0  and 1=1))  a 
left join OM_MODetails b on a.modetailsid=b.MODetailsID 
left join OM_MOMain c on b.MOID=c.MOID
group by a.cinvcode,c.cVenCode
*/
--select * from v_wwwwc