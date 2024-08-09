CREATE INDEX "idx_title" ON "public"."film" USING btree (
  "title" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);