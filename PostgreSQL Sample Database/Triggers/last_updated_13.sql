CREATE TRIGGER "last_updated" BEFORE UPDATE ON "public"."staff"
FOR EACH ROW
EXECUTE PROCEDURE "public"."last_updated"();