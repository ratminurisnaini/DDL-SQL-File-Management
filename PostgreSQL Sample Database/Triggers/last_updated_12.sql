CREATE TRIGGER "last_updated" BEFORE UPDATE ON "public"."rental"
FOR EACH ROW
EXECUTE PROCEDURE "public"."last_updated"();