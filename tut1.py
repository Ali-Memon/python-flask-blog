from flask import Flask,render_template
app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/ali')
def hello_ali():
    return 'Hello, Ali bhai!'

@app.route('/about')
def hello_hamza():
    name="MR. ALI MEMON"
    return render_template('about.html',name2=name) #name 2 goes in tempplate and name is taken from python code

@app.route('/bootstrap_template')
def bootstrap_template():
    return render_template('bootstrap_template.html')

if __name__ == '__main__':
    app.run(debug=True)


