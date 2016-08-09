-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied

CREATE OR REPLACE FUNCTION update_modified_at_column() RETURNS TRIGGER
LANGUAGE plpgsql AS $$ BEGIN NEW.modified_at = NOW(); RETURN NEW; END; $$;

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE records (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  data TEXT NOT NULL,
  category_id INT REFERENCES categories(id) NOT NULL,
  description TEXT NOT NULL,
  visibility BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_modified_at_records BEFORE UPDATE
ON records FOR EACH ROW EXECUTE PROCEDURE
update_modified_at_column();


-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP TABLE IF EXISTS records;
DROP TABLE IF EXISTS categories;
