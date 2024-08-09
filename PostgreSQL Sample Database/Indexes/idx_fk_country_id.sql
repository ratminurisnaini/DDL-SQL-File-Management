CREATE INDEX "idx_fk_country_id" ON "public"."city" USING btree (
  "country_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);