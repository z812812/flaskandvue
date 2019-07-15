create view v_allzz as
select        convert(int,isnull(ax1.iquantity,0))+convert(int,isnull(az1.zzsl,0))+convert(int,isnull(ac1.wrksl,0))+convert(int,isnull(aw1.wrksl,0))+
              convert(int,isnull(ax2.iquantity,0))+convert(int,isnull(az2.zzsl,0))+convert(int,isnull(ac2.wrksl,0))+convert(int,isnull(aw2.wrksl,0))+
              convert(int,isnull(ax3.iquantity,0))+convert(int,isnull(az3.zzsl,0))+convert(int,isnull(ac3.wrksl,0))+convert(int,isnull(aw3.wrksl,0))+
              convert(int,isnull(ax4.iquantity,0))+convert(int,isnull(az4.zzsl,0))+convert(int,isnull(ac4.wrksl,0))+convert(int,isnull(aw4.wrksl,0))+
              convert(int,isnull(ax5.iquantity,0))+convert(int,isnull(az5.zzsl,0))+convert(int,isnull(ac5.wrksl,0))+convert(int,isnull(aw5.wrksl,0))+
              convert(int,isnull(ax6.iquantity,0))+convert(int,isnull(az6.zzsl,0))+convert(int,isnull(ac6.wrksl,0))+convert(int,isnull(aw6.wrksl,0)) as 所有数量合计,
              a.one as 物料编码1,ax1.iquantity as 现存量1,az1.zzsl as 在制品合计1,ac1.cgsl as 采购总数量1,ac1.rksl as 采购入库总数量1,ac1.wrksl as 采购未入库数量1,aw1.cgsl as 委外总数量1,aw1.rksl as 委外入库总数量1,aw1.wrksl as 委外未入库数量1,
              a.two as 物料编码2,ax2.iquantity as 现存量2,az2.zzsl as 在制品合计2,ac2.cgsl as 采购总数量2,ac2.rksl as 采购入库总数量2,ac2.wrksl as 采购未入库数量2,aw2.cgsl as 委外总数量2,aw2.rksl as 委外入库总数量2,aw2.wrksl as 委外未入库数量2,
              a.three as 物料编码3,ax3.iquantity as 现存量3,az3.zzsl as 在制品合计3,ac3.cgsl as 采购总数量3,ac3.rksl as 采购入库总数量3,ac3.wrksl as 采购未入库数量3,aw3.cgsl as 委外总数量3,aw3.rksl as 委外入库总数量3,aw3.wrksl as 委外未入库数量3,
              a.four as 物料编码4,ax4.iquantity as 现存量4,az4.zzsl as 在制品合计4,ac4.cgsl as 采购总数量4,ac4.rksl as 采购入库总数量4,ac4.wrksl as 采购未入库数量4,aw4.cgsl as 委外总数量4,aw4.rksl as 委外入库总数量4,aw4.wrksl as 委外未入库数量4,
              a.five as 物料编码5,ax5.iquantity as 现存量5,az5.zzsl as 在制品合计5,ac5.cgsl as 采购总数量5,ac5.rksl as 采购入库总数量5,ac5.wrksl as 采购未入库数量5,aw5.cgsl as 委外总数量5,aw5.rksl as 委外入库总数量5,aw5.wrksl as 委外未入库数量5,
              a.six as 物料编码6,ax6.iquantity as 现存量6,az6.zzsl as 在制品合计6,ac6.cgsl as 采购总数量6,ac6.rksl as 采购入库总数量6,ac6.wrksl as 采购未入库数量6,aw6.cgsl as 委外总数量6,aw6.rksl as 委外入库总数量6,aw6.wrksl as 委外未入库数量6
              
              from vv_bom a
              left join v_currentstockzy ax1 on a.one=ax1.cinvcode
              left join v_sumzz az1 on a.one=az1.InvCode
              left join v_sumcg ac1 on a.one=ac1.cinvcode
              left join v_sumww aw1 on a.one=aw1.cinvcode
              
              left join v_currentstockzy ax2 on a.two=ax2.cinvcode
              left join v_sumzz az2 on a.two=az2.InvCode
              left join v_sumcg ac2 on a.two=ac2.cinvcode
              left join v_sumww aw2 on a.two=aw2.cinvcode
              
              left join v_currentstockzy ax3 on a.three=ax3.cinvcode
              left join v_sumzz az3 on a.three=az3.InvCode
              left join v_sumcg ac3 on a.three=ac3.cinvcode
              left join v_sumww aw3 on a.three=aw3.cinvcode
              
              left join v_currentstockzy ax4 on a.four=ax4.cinvcode
              left join v_sumzz az4 on a.four=az4.InvCode
              left join v_sumcg ac4 on a.four=ac4.cinvcode
              left join v_sumww aw4 on a.four=aw4.cinvcode
              
              left join v_currentstockzy ax5 on a.five=ax5.cinvcode
              left join v_sumzz az5 on a.five=az5.InvCode
              left join v_sumcg ac5 on a.five=ac5.cinvcode
              left join v_sumww aw5 on a.five=aw5.cinvcode
              
              left join v_currentstockzy ax6 on a.six=ax6.cinvcode
              left join v_sumzz az6 on a.six=az6.InvCode
              left join v_sumcg ac6 on a.six=ac6.cinvcode
              left join v_sumww aw6 on a.six=aw6.cinvcode