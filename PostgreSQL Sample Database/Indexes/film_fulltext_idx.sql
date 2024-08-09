CREATE INDEX "film_fulltext_idx" ON "public"."film" USING gist (
  "fulltext" "pg_catalog"."tsvector_ops"
);