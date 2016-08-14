
-- +micrate Up
CREATE TYPE reaction_type AS ENUM ('like', 'dislike', 'report');

CREATE TABLE reactions (
  id SERIAL PRIMARY KEY,
  ip VARCHAR(46) NOT NULL,
  record_id INT REFERENCES records(id) NOT NULL,
  type reaction_type NOT NULL,
  value INT default 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS reactions;
DROP TYPE IF EXISTS reaction_type;
