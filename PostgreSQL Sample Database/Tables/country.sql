CREATE TABLE "public"."country" (
  "country_id" int4 NOT NULL DEFAULT nextval('country_country_id_seq'::regclass),
  "country" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."country" ADD CONSTRAINT "country_pkey" PRIMARY KEY ("country_id");