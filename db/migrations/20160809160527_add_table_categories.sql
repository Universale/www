-- +micrate Up
CREATE OR REPLACE FUNCTION update_modified_at_column() RETURNS TRIGGER
LANGUAGE plpgsql AS $$ BEGIN NEW.modified_at = NOW(); RETURN NEW; END; $$;

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


-- +micrate Down
DROP TABLE IF EXISTS categories;
