CREATE TABLE "public"."film_category" (
  "film_id" int2 NOT NULL,
  "category_id" int2 NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."film_category" ADD CONSTRAINT "film_category_pkey" PRIMARY KEY ("film_id", "category_id");

ALTER TABLE "public"."film_category" ADD CONSTRAINT "film_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("category_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "public"."film_category" ADD CONSTRAINT "film_category_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "public"."film" ("film_id") ON DELETE RESTRICT ON UPDATE CASCADE;