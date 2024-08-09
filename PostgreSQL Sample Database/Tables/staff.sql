CREATE TABLE "public"."staff" (
  "staff_id" int4 NOT NULL DEFAULT nextval('staff_staff_id_seq'::regclass),
  "first_name" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "address_id" int2 NOT NULL,
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "store_id" int2 NOT NULL,
  "active" bool NOT NULL DEFAULT true,
  "username" varchar(16) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(40) COLLATE "pg_catalog"."default",
  "last_update" timestamp(6) NOT NULL DEFAULT now(),
  "picture" bytea
)
;

ALTER TABLE "public"."staff" ADD CONSTRAINT "staff_pkey" PRIMARY KEY ("staff_id");

ALTER TABLE "public"."staff" ADD CONSTRAINT "staff_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "public"."address" ("address_id") ON DELETE RESTRICT ON UPDATE CASCADE;