DROP TABLE trips;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE cities (
  id SERIAL8 primary key,
  name VARCHAR(255),
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE trips (
  id SERIAL8 primary key,
  city_id INT8 REFERENCES cities(id),
  visited BOOLEAN
);
