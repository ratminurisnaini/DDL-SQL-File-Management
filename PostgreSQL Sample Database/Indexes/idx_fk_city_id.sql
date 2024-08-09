CREATE INDEX "idx_fk_city_id" ON "public"."address" USING btree (
  "city_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);