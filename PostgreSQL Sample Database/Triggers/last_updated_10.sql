CREATE TRIGGER "last_updated" BEFORE UPDATE ON "public"."inventory"
FOR EACH ROW
EXECUTE PROCEDURE "public"."last_updated"();