CREATE TRIGGER "last_updated" BEFORE UPDATE ON "public"."store"
FOR EACH ROW
EXECUTE PROCEDURE "public"."last_updated"();