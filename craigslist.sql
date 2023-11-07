
-- in terminal:
-- psql < ddl.sql
-- psql craigslist

DROP DATABASE IF EXISTS  craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  post_title TEXT NOT NULL,
 post_text TEXT NOT NULL,
  user_id INTEGER ,
  category_id INTEGER,
  location_id INTEGER
);

CREATE TABLE categories
(
  category_id SERIAL PRIMARY KEY REFERENCES posts,
  category_name TEXT NOT NULL
);

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region_name TEXT NOT NULL

);
CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  location_name TEXT NOT NULL,
  preferred_region_id INTEGER

);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  preferred_region_id INTEGER ,
  location_id INTEGER

);







INSERT INTO posts
  (post_title,post_text,user_id, category_id,location_id)
VALUES
  ('Car For sale','5 year old Tesla for Sale- make an offer',1,4,6),
('Guitar for sale','Buy My Awesome Guitar',2,2,1),
('Apartment for Rent','Its got a view of the strip!',3,1,4),
('Now Hiring','Live the the dream - be a software engineer',3,3,5);


INSERT INTO categories
  (category_name)
VALUES
  ('Real Estate'),
  ('Music'),
  ('Jobs'),
  ('Automobiles');




INSERT INTO regions
  (region_name)
VALUES
  ('Northeast'),
  ('Midwest'),
  ('South'),
  ('West');


INSERT INTO locations
  (location_name)
VALUES
('New York'),
('Atlanta'),
('San Francisco'),
('Las Vegas'),
('Austin'),
('Miami');

INSERT INTO users
  (username,preferred_region_id,location_id)

  VALUES
('Dude1',	3,5),
('cool_guy',7,3),
('nicegirl1',5,4);





--Q1 what city can I find a job  as a software engineer?--
SELECT post_text,location_name
FROM posts
JOIN locations
ON posts.location_id = locations.id
WHERE category_id = 3;

--Q2 who is selling a guitar and what region is is located?
 SELECT users.username,region_name
FROM users
join posts
ON posts.user_id=users.id
JOIN categories
ON categories.category_id=posts.category_id
JOIN regions
ON users.preferred_region_id=regions.id;




