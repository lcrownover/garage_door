from flask import Flask, redirect, render_template, abort

from pi_o import pi_o

app = Flask(__name__)


@app.route('/')
def opener():
    return render_template('index.html')


@app.route('/execute')
def execute():
    if pi_o.execute() == 0:
        return redirect('/')
    else:
        abort(500)
        
@app.errorhandler(500)
def server_error(e):
    return render_template('500.html'), 500


if __name__ == "__main__":
    app.run(host='0.0.0.0')
