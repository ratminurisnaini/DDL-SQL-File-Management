CREATE TABLE "public"."address" (
  "address_id" int4 NOT NULL DEFAULT nextval('address_address_id_seq'::regclass),
  "address" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "address2" varchar(50) COLLATE "pg_catalog"."default",
  "district" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "city_id" int2 NOT NULL,
  "postal_code" varchar(10) COLLATE "pg_catalog"."default",
  "phone" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."address" ADD CONSTRAINT "address_pkey" PRIMARY KEY ("address_id");

ALTER TABLE "public"."address" ADD CONSTRAINT "fk_address_city" FOREIGN KEY ("city_id") REFERENCES "public"."city" ("city_id") ON DELETE NO ACTION ON UPDATE NO ACTION;