CREATE INDEX "idx_fk_inventory_id" ON "public"."rental" USING btree (
  "inventory_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);