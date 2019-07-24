from flask import Flask, render_template,request
import os
from myExcel import xlrd_tosqlserver

app = Flask(__name__)


@app.route("/aa", methods=['POST', 'GET'])
def hello():
    print('some one is visited')
    return render_template("index.html", **{'title': '上传文件'})


@app.route('/upload/', methods=['POST','GET'])
def upload():
    if request.method=='GET':
        return render_template("testJsFileUpload.html", **{'title': '上传文件'})
    file=request.files['file']
    if file:
        file.save(r"f:\ss.png")
        # xlrd_tosqlserver(r"f:\up.xls")
    print('have a file be upload')
    age=request.form.get('age',33)
    name=request.form.get('name','zy')
    print(age)
    print(name)
    return 'success'





if __name__ == "__main__":
    app.run()
