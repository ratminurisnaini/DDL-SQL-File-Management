CREATE TRIGGER "last_updated" BEFORE UPDATE ON "public"."language"
FOR EACH ROW
EXECUTE PROCEDURE "public"."last_updated"();