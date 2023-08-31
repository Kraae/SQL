"""Models for Blogly."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

DEFAULT_IMAGE_URL = "https://www.freeiconspng.com/uploads/blank-logo-design-for-brand-13.png"


def connect_db(app):
    """
    Connect this database
    """
    db.app = app
    db.init_app(app)


class User(db.Model):
    """user"""

    __tablename__ = "users"

    id = db.Column(db.Integer, primary_key=True)
    first_name = db.Column(db.Text, nullable=False)
    last_name = db.Column(db.Text, nullable=False)
    image_url = db.Column(db.Text, nullable=False, default=DEFAULT_IMAGE_URL)

    @property
    def full_name(self):
        """Return users full name"""
        return f"<{self.first_name} {self.last_name}>"
