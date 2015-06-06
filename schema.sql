-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:


DROP TABLE IF EXISTS artwork;
DROP TABLE IF EXISTS series;

CREATE TABLE series(
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  description varchar(255),
  series_date DATE,
  total_printed INT
);

CREATE TABLE artwork(
  id SERIAL PRIMARY KEY,
  series_num INT NOT NULL,
  title VARCHAR(100),
  artwork_date DATE,
  description VARCHAR(255),
  photo_url VARCHAR(255) NOT NULL,
  series_id INT REFERENCES series(id)
);
