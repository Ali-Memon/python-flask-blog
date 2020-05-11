from flask import Flask, render_template, request, session,redirect
from flask_sqlalchemy import SQLAlchemy
import json
from flask_mail import Mail
from datetime import datetime
import os
import math

from werkzeug.utils import secure_filename


local_server=True
with open('config.json','r') as c:
    params=json.load(c)["params"]
app = Flask(__name__)
app.secret_key = "super-secret-key"
app.config["UPLOAD_FOLDER"]=params["upload_location"]
app.config.update(
    MAIL_SERVER="smtp.gmail.com",
    MAIL_PORT="465",
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params["gmail_username"],
    MAIL_PASSWORD=params["gmail_password"],
)
mail=Mail(app)

if(local_server==True):
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] =params["prod_uri"]


db = SQLAlchemy(app)



class Contacts(db.Model):
    """sno, name, pn, msg.date.email"""
    sno = db.Column(db.Integer, primary_key=True) #unique=True matlab unique ho tab hi ae
    name = db.Column(db.String(80),  nullable=False) #nullable false means isma kuch value dana hi parahage
    email = db.Column(db.String(20),  nullable=False) #by def nullable true hota ha
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)



class Posts(db.Model):
    """sno, name, pn, msg.date.email"""
    sno = db.Column(db.Integer, primary_key=True) #unique=True matlab unique ho tab hi ae
    title = db.Column(db.String(80),  nullable=False) #nullable false means isma kuch value dana hi parahage
    slug = db.Column(db.String(21),  nullable=False) #by def nullable true hota ha
    content= db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file=db.Column(db.String(12), nullable=True)
    tagline= db.Column(db.String(120), nullable=True)



@app.route('/dashboard', methods=['GET','POST']) #added methods= just because to handle ka agar koi post request kara login ma gto kya ho
def dashboard():
    if request.method=="POST":#agar verify hojae to
        #redirect to admin panel
        username=request.form.get("uname")
        userpass=request.form.get("pass")

        if (username==params["admin_user"] and userpass==params["admin_password"]):
            #set the session variable
            session["user"]=username
            posts=Posts.query.all()
            return render_template("panel.html" ,params=params ,posts=posts)

        #agar user pahla sa logged in to kya hoga
    if ('user' in session and session["user"]==params["admin_user"]):
        posts = Posts.query.all()
        return render_template('panel.html',params=params,posts=posts)


    else:#warna wapis yeahi page render kardo
        return render_template('dashboard.html',params=params)

@app.route('/')
def home( ):
    posts = Posts.query.filter_by().all()
    last=math.ceil(len(posts)/int(params["no_of_posts"]))


    page=request.args.get("page")
    if not str(page).isnumeric():
        page=1
    # now slicing the posts
    page=int(page)
    posts=posts[(page-1)*int(params["no_of_posts"]):(page-1)*int(params["no_of_posts"])+int(params["no_of_posts"])]
    if page==1:
        prev="#"
        next="/?page="+ str(page+1)

    elif page==last:
        prev="/?page="+str(page-1)
        next="#"
    else:
        next = "/?page=" + str(page +1)
        prev = "/?page=" + str(page - 1)










    #posts=Posts.query.filter_by().all()[0:params["no_of_posts"]]


    return render_template('index.html',params=params,posts=posts,prev=prev,next=next)

@app.route('/about')
def about():
    return render_template('about.html',params=params)



@app.route("/edit/<string:sno>", methods=["GET","POST"])
def edit(sno):
    #checking if user is logged in
    if ('user' in session and session["user"] == params["admin_user"]):
        if request.method=="POST":
            box_title=request.form.get("title")
            tline=request.form.get("tline")
            slug=request.form.get("slug")
            content=request.form.get("content")
            img_file=request.form.get("img_file")
            date=datetime.now()
            if sno=="0":
                post=Posts(title=box_title,slug=slug,content=content,date=date,tagline=tline,img_file=img_file)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.tagline=tline
                post.content=content
                post.img_file=img_file
                post.slug=slug
                post.date=date
                db.session.commit()
                return redirect("/edit/"+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template("edit.html" ,params=params ,post=post)






@app.route('/contact', methods= ['GET','POST'])
def contact():
    #fetching entries
    if(request.method=='POST'):
        #parameters wala name sublime sa uthaya ha
        name=request.form.get('name')
        email=request.form.get('email')
        phone=request.form.get('phone')
        message=request.form.get('message')

        #adding entries to db
        #lhs wala database ka variable ha or rhs wala message jo ap dalna chahta ha
        entry=Contacts(name=name, phone_num=phone,msg=message,email=email,date=datetime.now())


        db.session.add(entry)
        db.session.commit()
        mail.send_message("New message from "+name,
                          sender=email,
                          recipients=[params["gmail_username"]],
                          body=message+"\n" +phone)


    return render_template('contact.html',params=params)



@app.route('/post/<string:post_slug>', methods=["GET"]) #hmara var ek string ha or uska name ha post_slug
def post_route(post_slug):#flask ka rule ha ka var function ka parameters ma bhi aega
    post=Posts.query.filter_by(slug=post_slug).first() #every post will have unique slug

    return render_template('post.html',params=params, post=post)#passing post in template


@app.route('/uploader', methods= ['GET','POST'])
def uploader():

    if ('user' in session and session["user"] == params["admin_user"]):
        if request.method == "POST":
            f=request.files["file1"]
            f.save(os.path.join(app.config["UPLOAD_FOLDER"], secure_filename(f.filename)))
            return "Uploaded successfully"
@app.route('/logout')
def logout():
    session.pop("user")
    return redirect("/dashboard")


@app.route("/delete/<string:sno>", methods=["GET","POST"])
def delete(sno):
    if ('user' in session and session["user"] == params["admin_user"]):
        post=Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")
if __name__ == '__main__':
    app.run(debug=True)
