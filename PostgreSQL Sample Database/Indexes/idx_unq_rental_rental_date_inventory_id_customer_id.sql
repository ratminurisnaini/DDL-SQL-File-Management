CREATE UNIQUE INDEX "idx_unq_rental_rental_date_inventory_id_customer_id" ON "public"."rental" USING btree (
  "rental_date" "pg_catalog"."timestamp_ops" ASC NULLS LAST,
  "inventory_id" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "customer_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);