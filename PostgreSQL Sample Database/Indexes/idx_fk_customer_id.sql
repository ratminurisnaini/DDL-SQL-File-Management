CREATE INDEX "idx_fk_customer_id" ON "public"."payment" USING btree (
  "customer_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);