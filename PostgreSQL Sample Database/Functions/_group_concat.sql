CREATE OR REPLACE FUNCTION "public"."_group_concat"(text, text)
  RETURNS "pg_catalog"."text" AS $BODY$
SELECT CASE
  WHEN $2 IS NULL THEN $1
  WHEN $1 IS NULL THEN $2
  ELSE $1 || ', ' || $2
END
$BODY$
  