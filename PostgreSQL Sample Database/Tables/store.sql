CREATE TABLE "public"."store" (
  "store_id" int4 NOT NULL DEFAULT nextval('store_store_id_seq'::regclass),
  "manager_staff_id" int2 NOT NULL,
  "address_id" int2 NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."store" ADD CONSTRAINT "store_pkey" PRIMARY KEY ("store_id");

ALTER TABLE "public"."store" ADD CONSTRAINT "store_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "public"."address" ("address_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "public"."store" ADD CONSTRAINT "store_manager_staff_id_fkey" FOREIGN KEY ("manager_staff_id") REFERENCES "public"."staff" ("staff_id") ON DELETE RESTRICT ON UPDATE CASCADE;