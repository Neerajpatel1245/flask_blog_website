from flask import Flask , render_template , redirect , url_for , request , session , flash
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column
from datetime import datetime
from werkzeug.utils import secure_filename
from flask_mail import Mail
import json
import math
import os


with open('F:\VS Code\Programs\\flask\Bootstrap Website\\templates\config.json' , 'r') as c:
     params=json.load(c)["params"]

local_server=True

app = Flask(__name__)

app.secret_key= 'thesecretkey'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
     MAIL_SERVER = "smtp.gmail.com",
     MAIL_PORT="465",
     MAIL_USE_SSL ="True",
     MAIL_USERNAME = params['gmail-user'],
     MAIL_PASSWORD = params['gmail-password']
)

mail=Mail(app)


if(local_server):
     app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
     app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):
    Srno: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(unique=False , nullable=False)
    email: Mapped[str] = mapped_column(unique=True , nullable=False)
    phone_num: Mapped[str] = mapped_column(unique=True , nullable=False)
    mes: Mapped[str] = mapped_column(unique=False , nullable=False)
    date: Mapped[str]  = mapped_column(unique=False ,)


class Posts(db.Model):
    Srno: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(unique=False , nullable=False)
    tag_line: Mapped[str] = mapped_column(unique=False , nullable=False)
    slug: Mapped[str] = mapped_column(unique=True , nullable=False)
    content: Mapped[str] = mapped_column(unique=False , nullable=False)
    author: Mapped[str] = mapped_column(unique=False , nullable=False)
    date: Mapped[str]  = mapped_column(unique=False ,)
    img_file: Mapped[str] = mapped_column(unique=False , nullable=False)



@app.route("/")
def home():
     flash("This is an simple example of message flashing" , "success")
     flash("You can flash  messages in for loop")
     posts= Posts.query.filter_by().all()
     #[0:params['no_of_post']]
     last=math.ceil(len(posts)/int(params['no_of_post']))

     page_no=request.args.get('page_no')
     if (not str(page_no).isnumeric()):
          page_no=1
     page_no=int(page_no)
     posts=posts[(page_no-1)*int(params['no_of_post']) : (page_no-1)*int(params['no_of_post'])+int(params['no_of_post']) ]
     if page_no==1:
          prev='#'
          nxt= "/?page_no="+ str(page_no+1)
     elif page_no==last:
          prev= "/?page_no="+ str(page_no-1)
          nxt='#'
     else:
          prev= "/?page_no="+ str(page_no-1)
          nxt= "/?page_no="+ str(page_no+1)
     
     return render_template('index.html' , params=params , posts=posts , prev=prev , nxt=nxt)


@app.route("/about")
def about():
     return render_template('about.html' , params=params)

@app.route("/edit/<string:Srno>"  , methods=['GET','POST'])
def edit(Srno):
     if 'user' in session and session['user'] == params['admin_mail']:
          if request.method=='POST':
               new_title=request.form.get('title')
               new_tag_line=request.form.get('tagline')
               new_slug=request.form.get('slug')
               new_content=request.form.get('content')
               new_author=request.form.get('author')
               new_img_file=request.form.get('img_file')

               if Srno=='0':
                    post=Posts(title=new_title, tagline=new_tagline, slug=new_slug,  content=new_content, author=new_author, img_file=new_img_file, date= datetime.now())
                    db.session.add(post)
                    db.session.commit()

               else:
                    post=Posts.query.filter_by(Srno=Srno).first()
                    post.title=new_title
                    post.tagline=new_tagline
                    post.slug=new_slug
                    post.author=new_author
                    post.content=new_content
                    post.img_file=new_img_file
                    post.date=datetime.now()
                    db.session.commit()
                    return redirect('/edit/Srno')

          post=Posts.query.filter_by(Srno=Srno).first()
          return render_template('edit.html' , params=params , post=post , Srno=Srno)

@app.route("/dashboard" , methods=['GET' , 'POST'])
def dashboard():

     if 'user' in session and session['user'] == params['admin_mail']:
          posts = Posts.query.all()
          return render_template('dashboard.html', params=params , posts=posts)

     elif request.method=='POST':
          email=request.form.get('email')
          passw=request.form.get('password')
          
          if (email==params['admin_mail'] and passw==params['admin_password']):
               session['user'] = email
               posts = Posts.query.all()
               return render_template('dashboard.html', params=params , posts=posts)

          else:
                return render_template('signin.html', params=params)


     else:     
          return render_template('signin.html', params=params)

@app.route("/uploader" , methods=['GET' , 'POST'])
def uploader():
     if 'user' in session and session['user'] == params['admin_mail']:
          if request.method=='POST':
               f=request.files['filename']
               f.save(os.path.join(app.config['UPLOAD_FOLDER'] , secure_filename(f.filename)))
               return "Uploaded Successfully"

@app.route("/logout")
def logout():
     session.pop("user" , None)
     return redirect( '/dashboard')

@app.route("/delete/<string:Srno>", methods=['GET' , 'POST'])
def delete(Srno):
     if 'user' in session and session['user'] == params['admin_mail']:
          post=Posts.query.filter_by(Srno=Srno).first()
          db.session.delete(post)
          db.session.commit()
    
     return redirect( '/dashboard')


@app.route("/layout")
def layout():
     return render_template( 'layout.html', params=params)


@app.route("/post/<string:post_slug>"  , methods=['GET', 'POST'])
def post_route(post_slug):
     posts=Posts.query.filter_by(slug=post_slug).first()
     return render_template('post.html' , params=params , post=posts)


@app.route("/contact" , methods=['GET', 'POST'] )
def contact():
     if(request.method=='POST'):
          #add entry to database
          name=request.form.get('name')
          email=request.form.get('email')
          phone_num=request.form.get('phone_num')
          message=request.form.get('message')
          
          entry=Contacts(name = name , email=email , phone_num=phone_num , mes=message , date= datetime.now())
          db.session.add(entry)
          db.session.commit()
          mail.send_message("new message from " +name, 
          sender="email" , 
          recipients=[params['gmail-user']],
          body= message +'\n' + phone_num)
          flash("Thanks for submitting. We will try to solve your query/problem" , "success")

     return render_template('contact.html' , params=params)



app.run(debug=True)