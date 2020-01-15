from flask_wtf import FlaskForm
from wtforms.fields import StringField, PasswordField, SubmitField
from wtforms.validators import Email, DataRequired, EqualTo, Length, ValidationError
from app.models import User


class RegistrationForm(FlaskForm):
    username = StringField('Username:',
                           validators=[DataRequired('Username is required'),  Length(min=8, max=80, message='Must contain min 8, max 80')])
    email = StringField('Email:',
                        validators=[DataRequired('Email is required'), Email('It\'s must be valid email')])
    password = PasswordField('Password:',
                             validators=[DataRequired('Password is required'), EqualTo('password2', 'Passwords must match'),
                                         Length(min=8, max=80, message='Must contain min 8, max 80')])
    password2 = PasswordField('Confirm password:', validators=[DataRequired('Password is required'),
                                                               Length(min=8, max=80, message='Must contain min 8, max 80')])
    submit = SubmitField('Sign up')

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user is not None:
            raise ValidationError('User with the same name already exists')

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is not None:
            raise ValidationError('User with the same email already exists')


class LoginForm(FlaskForm):
    username = StringField('Username:', validators=[DataRequired('Username is required')])
    password = PasswordField('Password:', validators=[DataRequired('Password is required')])
    submit = SubmitField('Sign in')


