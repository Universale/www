-- +micrate Up
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

-- +micrate Down
DROP TABLE IF EXISTS categories;
