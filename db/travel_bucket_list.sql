DROP TABLE trips;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 primary key,
  name VARCHAR
);

CREATE TABLE cities (
  id SERIAL8 primary key,
  name VARCHAR,
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE trips (
id SERIAL8 PRIMARY KEY,
name VARCHAR,
visited BOOLEAN,
city_id INT8 REFERENCES cities(id) ON DELETE CASCADE
);