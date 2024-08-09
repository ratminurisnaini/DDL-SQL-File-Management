CREATE TABLE "public"."film" (
  "film_id" int4 NOT NULL DEFAULT nextval('film_film_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "release_year" "public"."year",
  "language_id" int2 NOT NULL,
  "rental_duration" int2 NOT NULL DEFAULT 3,
  "rental_rate" numeric(4,2) NOT NULL DEFAULT 4.99,
  "length" int2,
  "replacement_cost" numeric(5,2) NOT NULL DEFAULT 19.99,
  "rating" "public"."mpaa_rating" DEFAULT 'G'::mpaa_rating,
  "last_update" timestamp(6) NOT NULL DEFAULT now(),
  "special_features" text[] COLLATE "pg_catalog"."default",
  "fulltext" tsvector NOT NULL
)
;

ALTER TABLE "public"."film" ADD CONSTRAINT "film_pkey" PRIMARY KEY ("film_id");

ALTER TABLE "public"."film" ADD CONSTRAINT "film_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "public"."language" ("language_id") ON DELETE RESTRICT ON UPDATE CASCADE;