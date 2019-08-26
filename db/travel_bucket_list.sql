DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE cities (
  id SERIAL8 primary key,
  name VARCHAR(255),
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE,
  visited BOOLEAN
);
