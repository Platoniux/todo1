from app import app, db
from flask import render_template, escape
from app.models import User
from app.forms import RegistrationForm, LoginForm


@app.route('/')
def index():
    return render_template('main.html.j2')


@app.route('/registration')
def registration():
    form = RegistrationForm()
    return render_template('register.html.j2', form=form)


@app.route('/login')
def login():
    form = LoginForm()
    return render_template('login.html.j2', form=form)

