-- +micrate Up
CREATE OR REPLACE FUNCTION update_updated_at_column() RETURNS TRIGGER
LANGUAGE plpgsql AS $$ BEGIN NEW.updated_at = NOW(); RETURN NEW; END; $$;

-- +micrate Down
DROP FUNCTION update_updated_at_column();
