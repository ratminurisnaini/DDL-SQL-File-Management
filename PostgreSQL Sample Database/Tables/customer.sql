CREATE TABLE "public"."customer" (
  "customer_id" int4 NOT NULL DEFAULT nextval('customer_customer_id_seq'::regclass),
  "store_id" int2 NOT NULL,
  "first_name" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "address_id" int2 NOT NULL,
  "activebool" bool NOT NULL DEFAULT true,
  "create_date" date NOT NULL DEFAULT ('now'::text)::date,
  "last_update" timestamp(6) DEFAULT now(),
  "active" int4
)
;

ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id");

ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "public"."address" ("address_id") ON DELETE RESTRICT ON UPDATE CASCADE;