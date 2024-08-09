CREATE INDEX "idx_fk_rental_id" ON "public"."payment" USING btree (
  "rental_id" "pg_catalog"."int4_ops" ASC NULLS LAST
);