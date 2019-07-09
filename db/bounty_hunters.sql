DROP TABLE IF EXISTS bounty_hunters;

CREATE TABLE bounty_hunters (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT2,
  favourite_weapon VARCHAR(255),
  last_location VARCHAR(255)
);
