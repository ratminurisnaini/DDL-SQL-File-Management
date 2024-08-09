CREATE UNIQUE INDEX "idx_unq_manager_staff_id" ON "public"."store" USING btree (
  "manager_staff_id" "pg_catalog"."int2_ops" ASC NULLS LAST
);