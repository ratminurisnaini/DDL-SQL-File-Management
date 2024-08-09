CREATE INDEX "idx_fk_address_id" ON "public"."customer" USING btree (
  "address_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);