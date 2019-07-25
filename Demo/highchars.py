from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def index():
    return render_template('highcharts.html')


if __name__ == '__main__':
    app.run()
