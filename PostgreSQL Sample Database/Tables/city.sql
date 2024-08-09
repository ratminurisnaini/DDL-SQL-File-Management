CREATE TABLE "public"."city" (
  "city_id" int4 NOT NULL DEFAULT nextval('city_city_id_seq'::regclass),
  "city" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "country_id" int2 NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."city" ADD CONSTRAINT "city_pkey" PRIMARY KEY ("city_id");

ALTER TABLE "public"."city" ADD CONSTRAINT "fk_city" FOREIGN KEY ("country_id") REFERENCES "public"."country" ("country_id") ON DELETE NO ACTION ON UPDATE NO ACTION;