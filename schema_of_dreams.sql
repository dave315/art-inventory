-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:


DROP TABLE IF EXISTS artwork;
DROP TABLE IF EXISTS series;
DROP TABLE IF EXISTS art_type;
DROP TABLE IF EXISTS condition;
DROP TABLE IF EXISTS frame;
DROP TABLE IF EXISTS artist;

CREATE TABLE series(
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  description varchar(255),
  series_date DATE,
  total_printed INT
);

CREATE TABLE art_type(
  id SERIAL PRIMARY KEY,
  art_type varchar(100)
);

CREATE TABLE artist(
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE condition(
  id SERIAL PRIMARY KEY,
  condition_type varchar(100)
);

CREATE TABLE frame(
  id SERIAL PRIMARY KEY,
  framed varchar(10) NOT NULL
);

CREATE TABLE artwork(
  id SERIAL PRIMARY KEY,
  series_num INT NOT NULL,
  title VARCHAR(100),
  artwork_date DATE,
  description VARCHAR(255),
  photo_url VARCHAR(255) NOT NULL,
  price MONEY,
  length INT,
  height INT,
  frame_id INT REFERENCES frame(id),
  condition_id INT REFERENCES condition(id),
  series_id INT REFERENCES series(id),
  art_id INT REFERENCES art_type(id),
  artist_id INT REFERENCES artist(id)
);
