from flask import Flask

app = Flask(__name__)

@app.route("/hello/",methods=['POST','GET'])
def hello():
    return 'hello world zy'

if __name__ == "__main__":
    app.run()
