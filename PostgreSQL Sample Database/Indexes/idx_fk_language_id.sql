CREATE INDEX "idx_fk_language_id" ON "public"."film" USING btree (
  "language_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);