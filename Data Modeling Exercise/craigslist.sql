-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post_text TEXT NOT NULL,
  post_location TEXT NOT NULL,
  region_id TEXT NOT NULL,
  category_id TEXT NOT NULL,
  user_id TEXT NOT NULL,
);

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name_region TEXT NOT NULL,
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name_category TEXT NOT NULL,
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  user_name TEXT NOT NULL,
  user_password TEXT NOT NULL,
  preferred_region_id TEXT NOT NULL,
);

INSERT INTO posts
  (title, post_text, post_location, region_id, category_id, user_id)
VALUES
  ('title', 'post_text', 'post_location'),
  ('title', 'post_text', 'post_location'),
  ('title', 'post_text', 'post_location'),
 
 INSERT INTO regions
  (name_region)
VALUES
 ('name_region_1'),
 ('name_region_2'),
 ('name_region_3'),
 ('name_region_4'),
 
 INSERT INTO categories
  (name_category)
VALUES
  ('name_category_1'),
  ('name_category_2'),
  ('name_category_3'),
 

 INSERT INTO users
  (user_name, user_password, preferred_region_id)
VALUES
  ('user_name', 'user_password_1', '1.1'),
  ('user_name', 'user_password_2', '1.2'),
  ('user_name', 'user_password_3', '1.3'),
  