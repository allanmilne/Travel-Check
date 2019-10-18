DROP TABLE trips;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 primary key,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE cities (
  id SERIAL8 primary key,
  name VARCHAR(255) ,
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE trips (
id SERIAL8 PRIMARY KEY,
name VARCHAR(255) NOT NULL,
visited BOOLEAN,
city_id INT8 REFERENCES cities(id) ON DELETE CASCADE
);