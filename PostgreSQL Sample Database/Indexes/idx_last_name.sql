CREATE INDEX "idx_last_name" ON "public"."customer" USING btree (
  "last_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);