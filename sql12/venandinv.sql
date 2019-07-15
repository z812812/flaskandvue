select cInvCode,COUNT(*) from VenAndInv where cInvCode like '10%' or cInvCode like '11%'
group by cInvCode,iSuppProperty having COUNT(*)>1