-- +micrate Up
CREATE TABLE records (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  data TEXT NOT NULL,
  category_id INT REFERENCES categories(id) NOT NULL,
  description TEXT NOT NULL,
  visibility BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT data_uniq UNIQUE (data)
);

CREATE TRIGGER update_modified_at_records BEFORE UPDATE
ON records FOR EACH ROW EXECUTE PROCEDURE
update_modified_at_column();

-- +micrate Down
DROP TABLE IF EXISTS records;
