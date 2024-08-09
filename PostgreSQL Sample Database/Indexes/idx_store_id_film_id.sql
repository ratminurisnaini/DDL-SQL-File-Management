CREATE INDEX "idx_store_id_film_id" ON "public"."inventory" USING btree (
  "store_id" "pg_catalog"."int2_ops" ASC NULLS LAST,
  "film_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);