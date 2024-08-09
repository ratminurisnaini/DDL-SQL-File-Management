CREATE OR REPLACE FUNCTION "public"."inventory_held_by_customer"("p_inventory_id" int4)
  RETURNS "pg_catalog"."int4" AS $BODY$
DECLARE
    v_customer_id INTEGER;
BEGIN

  SELECT customer_id INTO v_customer_id
  FROM rental
  WHERE return_date IS NULL
  AND inventory_id = p_inventory_id;

  RETURN v_customer_id;
END $BODY$
  