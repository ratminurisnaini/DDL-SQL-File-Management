CREATE TRIGGER "film_fulltext_trigger" BEFORE INSERT OR UPDATE ON "public"."film"
FOR EACH ROW
EXECUTE PROCEDURE "pg_catalog"."tsvector_update_trigger"('fulltext', 'pg_catalog.english', 'title', 'description');