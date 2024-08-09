CREATE TABLE "public"."rental" (
  "rental_id" int4 NOT NULL DEFAULT nextval('rental_rental_id_seq'::regclass),
  "rental_date" timestamp(6) NOT NULL,
  "inventory_id" int4 NOT NULL,
  "customer_id" int2 NOT NULL,
  "return_date" timestamp(6),
  "staff_id" int2 NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."rental" ADD CONSTRAINT "rental_pkey" PRIMARY KEY ("rental_id");

ALTER TABLE "public"."rental" ADD CONSTRAINT "rental_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "public"."rental" ADD CONSTRAINT "rental_inventory_id_fkey" FOREIGN KEY ("inventory_id") REFERENCES "public"."inventory" ("inventory_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "public"."rental" ADD CONSTRAINT "rental_staff_id_key" FOREIGN KEY ("staff_id") REFERENCES "public"."staff" ("staff_id") ON DELETE NO ACTION ON UPDATE NO ACTION;