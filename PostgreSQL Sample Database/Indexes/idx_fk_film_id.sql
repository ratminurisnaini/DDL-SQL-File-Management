CREATE INDEX "idx_fk_film_id" ON "public"."film_actor" USING btree (
  "film_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);