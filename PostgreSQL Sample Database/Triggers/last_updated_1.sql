CREATE TRIGGER "last_updated" BEFORE UPDATE ON "public"."actor"
FOR EACH ROW
EXECUTE PROCEDURE "public"."last_updated"();