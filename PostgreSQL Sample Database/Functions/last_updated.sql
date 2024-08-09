CREATE OR REPLACE FUNCTION "public"."last_updated"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
BEGIN
    NEW.last_update = CURRENT_TIMESTAMP;
    RETURN NEW;
END $BODY$
  