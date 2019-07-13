from flask import Flask, render_template,request
import os
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
        file.save(os.path.join('\\up.{}'.format(filename.rsplit('.',1)[-1])))
    print('have a file be uplaod')
    return render_template("changeOrdersDate.html",**{'title':'更改订单日期'})


if __name__ == "__main__":
    app.run()
