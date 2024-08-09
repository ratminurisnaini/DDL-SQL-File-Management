CREATE OR REPLACE FUNCTION "public"."film_in_stock"(IN "p_film_id" int4, IN "p_store_id" int4, OUT "p_film_count" int4)
  RETURNS SETOF "pg_catalog"."int4" AS $BODY$
     SELECT inventory_id
     FROM inventory
     WHERE film_id = $1
     AND store_id = $2
     AND inventory_in_stock(inventory_id);
$BODY$
  