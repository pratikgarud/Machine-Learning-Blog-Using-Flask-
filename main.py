from flask import Flask,render_template,request, session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json,math

with open('config.json','r') as c:
    params = json.load(c) ['params']

local_server = True
app = Flask(__name__)
app.config['SECRET_KEY'] = 'SUPER_SECRET_KEY'
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
db = SQLAlchemy(app)

class ContactDataBase(db.Model):
    __tablename__= 'contactdata'

    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(25), nullable= False)
    email = db.Column(db.String(25), nullable=False)
    phone_no = db.Column(db.String(10), nullable=False)
    msg = db.Column(db.String(100), nullable=False)
    date = db.Column(db.String(12), nullable=True)

class PostData(db.Model):
    __tablename__= 'posts'

    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(100), nullable= False)
    slug = db.Column(db.String(25), nullable=False)
    content = db.Column(db.String(150), nullable=False)
    img_file = db.Column(db.String(150), nullable=False)
    date = db.Column(db.String(12), nullable=True)

@app.route('/')
def home():
    posts = PostData.query.filter_by().all()
    last = math.floor(len(posts)/int(params['no_post']))
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_post']): (page-1)*int(params['no_post']) + int(params['no_post'])]
    if page == 1:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params,posts=posts, prev=prev, next=next)

@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = PostData.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('username')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_pass']):
            session['user'] = username
            posts = PostData.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    return render_template('login.html')

@app.route('/edit/<string:sno>', methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            title = request.form.get('title')
            slug = request.form.get('slug')
            img_file = request.form.get('img_file')
            content = request.form.get('content')
            date = datetime.now()
            if sno == '0':
                post = PostData(title=title,slug=slug,img_file=img_file,content=content,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = PostData.query.filter_by(sno=sno).first()
                post.title = title
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
    post = PostData.query.filter_by(sno=sno).first()
    return render_template('edit.html', params=params, post=post, sno=sno)


@app.route('/login')
def login():
    return render_template('login.html',params=params)


@app.route("/post/<string:post_slug>", methods = ['GET'])
def post_route(post_slug):
    post = PostData.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        ph = request.form.get('ph')
        msg = request.form.get('msg')
        entry = ContactDataBase(name=name,email=email,phone_no=ph,msg=msg,date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html', params=params)

@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = PostData.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/login')


if __name__=='__main__':
    app.run(debug=True)