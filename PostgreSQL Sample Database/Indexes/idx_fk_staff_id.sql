CREATE INDEX "idx_fk_staff_id" ON "public"."payment" USING btree (
  "staff_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);