create view v_allzz as
select        convert(int,isnull(ax1.iquantity,0))+convert(int,isnull(az1.zzsl,0))+convert(int,isnull(ac1.wrksl,0))+convert(int,isnull(aw1.wrksl,0))+
              convert(int,isnull(ax2.iquantity,0))+convert(int,isnull(az2.zzsl,0))+convert(int,isnull(ac2.wrksl,0))+convert(int,isnull(aw2.wrksl,0))+
              convert(int,isnull(ax3.iquantity,0))+convert(int,isnull(az3.zzsl,0))+convert(int,isnull(ac3.wrksl,0))+convert(int,isnull(aw3.wrksl,0))+
              convert(int,isnull(ax4.iquantity,0))+convert(int,isnull(az4.zzsl,0))+convert(int,isnull(ac4.wrksl,0))+convert(int,isnull(aw4.wrksl,0))+
              convert(int,isnull(ax5.iquantity,0))+convert(int,isnull(az5.zzsl,0))+convert(int,isnull(ac5.wrksl,0))+convert(int,isnull(aw5.wrksl,0))+
              convert(int,isnull(ax6.iquantity,0))+convert(int,isnull(az6.zzsl,0))+convert(int,isnull(ac6.wrksl,0))+convert(int,isnull(aw6.wrksl,0)) as ���������ϼ�,
              a.one as ���ϱ���1,ax1.iquantity as �ִ���1,az1.zzsl as ����Ʒ�ϼ�1,ac1.cgsl as �ɹ�������1,ac1.rksl as �ɹ����������1,ac1.wrksl as �ɹ�δ�������1,aw1.cgsl as ί��������1,aw1.rksl as ί�����������1,aw1.wrksl as ί��δ�������1,
              a.two as ���ϱ���2,ax2.iquantity as �ִ���2,az2.zzsl as ����Ʒ�ϼ�2,ac2.cgsl as �ɹ�������2,ac2.rksl as �ɹ����������2,ac2.wrksl as �ɹ�δ�������2,aw2.cgsl as ί��������2,aw2.rksl as ί�����������2,aw2.wrksl as ί��δ�������2,
              a.three as ���ϱ���3,ax3.iquantity as �ִ���3,az3.zzsl as ����Ʒ�ϼ�3,ac3.cgsl as �ɹ�������3,ac3.rksl as �ɹ����������3,ac3.wrksl as �ɹ�δ�������3,aw3.cgsl as ί��������3,aw3.rksl as ί�����������3,aw3.wrksl as ί��δ�������3,
              a.four as ���ϱ���4,ax4.iquantity as �ִ���4,az4.zzsl as ����Ʒ�ϼ�4,ac4.cgsl as �ɹ�������4,ac4.rksl as �ɹ����������4,ac4.wrksl as �ɹ�δ�������4,aw4.cgsl as ί��������4,aw4.rksl as ί�����������4,aw4.wrksl as ί��δ�������4,
              a.five as ���ϱ���5,ax5.iquantity as �ִ���5,az5.zzsl as ����Ʒ�ϼ�5,ac5.cgsl as �ɹ�������5,ac5.rksl as �ɹ����������5,ac5.wrksl as �ɹ�δ�������5,aw5.cgsl as ί��������5,aw5.rksl as ί�����������5,aw5.wrksl as ί��δ�������5,
              a.six as ���ϱ���6,ax6.iquantity as �ִ���6,az6.zzsl as ����Ʒ�ϼ�6,ac6.cgsl as �ɹ�������6,ac6.rksl as �ɹ����������6,ac6.wrksl as �ɹ�δ�������6,aw6.cgsl as ί��������6,aw6.rksl as ί�����������6,aw6.wrksl as ί��δ�������6
              
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