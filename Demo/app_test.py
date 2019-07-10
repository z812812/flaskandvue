# coding=utf-8
from flask import Flask, jsonify, request, make_response, send_file, render_template
import requests, json
from getsql import getsql, getmysql
import os
from xlwt import *

app = Flask(__name__)


@app.route('/home/zz/', methods=['POST'])
def hello():
    print(request.form)
    return '66'


# 如果不存在则绑定openid，否则返回已绑定
@app.route('/home/getid/', methods=['POST'])
def getid():
    print('23434234')
    vidno = request.form.get('personid')
    openid = request.form.get('openid')
    print(openid)
    mysql_sql = "select count(*) count from userinfo where openid='{}'".format(openid)
    get_mysql_result = getmysql().query(sql=mysql_sql)
    if get_mysql_result[0].get('count'):
        print('11')
        return 'idbinded'
    else:
        sql = "select cPsn_Num,cPsn_Name,vIDNo from hr_hi_person where vidno='{}'".format(vidno)
        get_sqlserver_result = getsql().query(sql)
        if (get_sqlserver_result):
            person_number = get_sqlserver_result[0].get('cPsn_Num')
            sql2 = "insert into userinfo (openid,工号,logindate,logintime,lastdate) \
            values ('{}','{}',{},{},{})".format(openid, person_number, 'now()', 'logintime+1', 'now()')
            get_mysql_count = getmysql().insert(sql2)
            if (get_mysql_count == 1):
                print('success')
                return 'success'
            else:
                print('fail1')
                return 'fail1'
        else:
            print('fail')
            return 'fail'


# 接受code换取openid
@app.route('/home/getcode/', methods=['POST'])
def getcode():
    code = request.form['code']
    appid = 'wx230ba8f4dec1fb33'
    secret = '4c785df4866367195e68242d5fe7b06f'
    grant_type = 'authorization_code'
    url = "https://api.weixin.qq.com/sns/jscode2session?js_code=" + code + "&appid=" + appid + "&secret=" + secret + "&grant_type=" + grant_type
    openid = requests.get(url)
    print(openid.json())
    return openid.json()['openid']


# 查询工资
@app.route('/home/querysalary/', methods=['POST'])
def querysalary():
    openid = request.form.get('openid')
    print('{}'.format('查询工资：') + openid)
    getmysql().update_msg(openid)
    sql = "select * from gz where 工号=(select 工号 from userinfo where openid='{}')".format(openid)
    get_mysql_result = getmysql().query(sql)
    return json.dumps(get_mysql_result[0])


# 查询完工单
@app.route('/home/querywgd/', methods=['POST'])
def querywgd():
    openid = request.form.get('openid')
    print('{}'.format('查询完工单：') + openid)
    type = request.form.get('type')
    getmysql().update_msg(openid)
    number = ''
    if (openid):
        sql = "select 工号 from userinfo where openid='{}'".format(openid)
        result = getmysql().query(sql)
        number = result[0].get('工号')
        if (type):
            sql = "exec proc_zy_processflow '{}', {}".format(number, '1')
            result = getsql().query(sql)
            if (result):
                return json.dumps(result)
            return 'fail'
        else:
            sql = "exec proc_zy_processflow '{}', {}".format(number, '2')
            result = getsql().query(sql)
            if (result):
                return json.dumps(result)
            return 'fail'
    return number


# 查询通知
@app.route('/home/bbs/', methods=['get'])
def query_bbs():
    sql = "select  title,content from bbs LIMIT 1"
    result = getmysql().query(sql)
    if result is not None:
        print('查询BBS')
        return json.dumps(result)
    return '11'


# 返回下载文件
@app.route('/home/xls/', methods=['get'])
def download_xls():
    file = '/home/zy/file/venandprice.xls'
    # sql="select top 1 * from zy_inventory"
    sql = "exec [proc_zy_cunhuoandprice]"
    resulte = getsql().query(sql)
    row = len(resulte)
    title = []
    for k, v in resulte[0].items():
        title.append(k)

    col = len(title)
    wbk = Workbook()
    sheet1 = wbk.add_sheet('sheet1', cell_overwrite_ok=True)
    for i in range(0, len(title)):
        sheet1.write(0, i, title[i])
    for a in range(row):
        for j in range(col):
            sheet1.write(a + 1, j, resulte[a]['{}'.format(title[j])])

    if os.path.exists(file):
        os.remove(file)
    wbk.save(file)
    response = make_response(send_file(file))
    response.headers["Content-Disposition"] = "attachment; filename=22.xls;"
    return response


# wangqian更改存货档案及对照
@app.route('/home/changeinv/', methods=['get', 'post'])
def changeinv():
    if request.method == 'POST':
        return 'heel'
    return render_template('changeinv.html')


@app.route('/home/iquery/', methods=['get', 'post'])
def iquery():
    if request.method == 'GET':
        return 'error'
    elif request.method == 'POST':
        cinvcode = request.form.get('cinvcode')
        sql = "select top 1 cinvcode,cinvname,cinvstd,cinvaddcode,iInvAdvance  from inventory " \
              "where cinvcode='{}'".format(cinvcode)
        result = getsql().query(sql)
        return json.dumps(result)
    return 'some error is orcor'


@app.route('/home/change/',methods=['post'])
def change():
    cinvcode = request.form.get('cinvcode').strip()
    cinvname = request.form.get('cinvname').strip()
    cinvstd = request.form.get('cinvstd').strip()
    cinvaddcode = request.form.get('cinvaddcode').strip()
    iInvAdvance = request.form.get('iInvAdvance').strip()
    sql = "update inventory set cinvname='{}',cinvstd='{}',cinvaddcode='{}',iInvAdvance='{}' " \
          "where cinvcode='{}'".format(cinvname,cinvstd,cinvaddcode,iInvAdvance,cinvcode)
    sql2 = "update venandinv set fAdvDate='{}' where cinvcode='{}'".format(iInvAdvance,cinvcode)
    row1=getsql().inert(sql)
    row2=getsql().inert(sql2)
    if row1 and row2:
        return json.dumps([{'cinvcode':cinvcode}])
    else:
        return 'fail'


if __name__ == '__main__':
    app.run()
