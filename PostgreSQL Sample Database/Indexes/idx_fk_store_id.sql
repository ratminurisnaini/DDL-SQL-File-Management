CREATE INDEX "idx_fk_store_id" ON "public"."customer" USING btree (
  "store_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);