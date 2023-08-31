"""Models for Blogly."""

from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

default_image = "https://www.freeiconspng.com/uploads/blank-logo-design-for-brand-13.png"


def connect_db(app):
    """
    Connect this database
    """
    db.app = app
    db.init_app(app)


class User(db.Model):
    """user"""

    __tablename__ = "users"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)
    first_name = db.Column(db.String(50),
                           nullable=False)
    last_name = db.Column(db.String(50),
                          nullable=False)
    image_url = db.Column(db.String(), default=default_image)

    posts = db.relationship("Post", backref="user",
                            cascade="all, delete-orphan")

    @property
    def full_name(self):
        """Return users full name"""
        return f"<{self.first_name} {self.last_name}>"


class Post(db.Model):
    '''Posts'''
    __tablename__ = "posts"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)
    title = db.Column(db.String(50),
                      nullable=False)
    content = db.Column(db.String(350),
                        nullable=False)
    created_at = db.Column(db.DateTime,
                           default=datetime.datetime.utcnow)
    user_id = db.Column(db.Integer,
                        db.ForeignKey('users.id'),
                        nullable=False)

    @property
    def friendly_date(self):
        """Return Date (https://mrcoles.com/dateknight/)"""
        return self.created_at.strptime("%a %b %-d  %Y, %-I:%M %p")
