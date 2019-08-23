DROP TABLE trips;
DROP TABLE countries;
DROP TABLE cities;

CREATE TABLE countries (
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE cities (
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  country_id INT8 references countries(id)
);

CREATE TABLE trips (
  id SERIAL8 primary key,
  city_id INT8 references cities(id),
  visited BOOLEAN
);
