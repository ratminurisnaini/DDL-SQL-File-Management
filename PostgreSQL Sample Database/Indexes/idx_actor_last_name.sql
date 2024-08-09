CREATE INDEX "idx_actor_last_name" ON "public"."actor" USING btree (
  "last_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);