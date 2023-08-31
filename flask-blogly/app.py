"""Blogly application."""

from flask import Flask, request, redirect, render_template
from models import db, connect_db, User
from flask_debugtoolbar import DebugToolbarExtension

app = Flask(__name__)
app.config['SECRET_KEY'] = 'itsasecret'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
toolbar = DebugToolbarExtension(app)

connect_db(app)
db.create_all()


@app.route('/')
def root():
    return redirect("/users")


@app.route('/users')
def users_list():
    """lists all users in the database as links to profile"""
    """Grabs the user table information from the database"""
    users = User.query.order_by(User.last_name, User.first_name).all()
    return render_template('lists.html', users=users)


@app.route('/users/new', methods=["POST"])
def user_add_form():
    """the form that adds a new user"""
    return render_template('form.html')


@app.route("/users/new", methods=["POST"])
def users_user():
    """adds the user to the database"""

    new_user = User(
        first_name=request.form['first_name'],
        last_name=request.form['last_name'],
        image_url=request.form['image_url'] or None)
    db.session.add(new_user)
    db.session.commit()
    return redirect("/")


@app.route('/users/<int:user_id>')
def users_show(user_id):
    """specific user"""
    user = User.query.get_or_404(user_id)
    return render_template('profile.html', user=user)


@app.route('/users/<int:user_id>/edit')
def users_edit(user_id):
    """Show a form to edit an existing user"""
    user = User.query.get_or_404(user_id)
    return render_template('edit.html', user=user)


@app.route('/users/<int:user_id>/edit', methods=["POST"])
def users_update(user_id):
    user = User.query.get_or_404(user_id)
    user.first_name = request.form['first_name'],
    user.last_name = request.form['last_name'],
    user.image_url = request.form['image_url']

    db.session.add(user)
    db.session.commit()
    return redirect("/")


@app.route('/users/<int:user_id>/delete', methods=["POST"])
def users_destroy(user_id):
    user = User.query.get_or_404(user_id)
    db.session.delete(user)
    db.session.commit()

    return redirect("/")
