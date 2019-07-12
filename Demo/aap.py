from flask import Flask,render_template

app = Flask(__name__)

@app.route("/",methods=['POST','GET'])
def hello():
    print('some one is visited')
    return render_template("index.html",**{'title':'你好','name':'钟源'})

if __name__ == "__main__":
    app.run()
