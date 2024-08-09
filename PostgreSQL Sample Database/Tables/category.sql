CREATE TABLE "public"."category" (
  "category_id" int4 NOT NULL DEFAULT nextval('category_category_id_seq'::regclass),
  "name" varchar(25) COLLATE "pg_catalog"."default" NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."category" ADD CONSTRAINT "category_pkey" PRIMARY KEY ("category_id");