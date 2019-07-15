from flask import Flask, render_template,request
import os
from myExcel import xlrd_tosqlserver

app = Flask(__name__)


@app.route("/", methods=['POST', 'GET'])
def hello():
    print('some one is visited')
    return render_template("index.html", **{'title': '上传文件'})


@app.route('/upload/', methods=['POST'])
def upload():
    file=request.files['file']
    filename=file.filename
    if file:
        file.save(r"f:\up.xls")
        xlrd_tosqlserver(r"f:\up.xls")
    print('have a file be uplaod')
    return render_template("changeOrdersDate.html",**{'title':'更改订单日期','message':'更改成功'})


if __name__ == "__main__":
    app.run()
