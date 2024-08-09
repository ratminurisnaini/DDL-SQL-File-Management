CREATE TABLE "public"."payment" (
  "payment_id" int4 NOT NULL DEFAULT nextval('payment_payment_id_seq'::regclass),
  "customer_id" int2 NOT NULL,
  "staff_id" int2 NOT NULL,
  "rental_id" int4 NOT NULL,
  "amount" numeric(5,2) NOT NULL,
  "payment_date" timestamp(6) NOT NULL
)
;

ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_pkey" PRIMARY KEY ("payment_id");

ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customer" ("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_rental_id_fkey" FOREIGN KEY ("rental_id") REFERENCES "public"."rental" ("rental_id") ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_staff_id_fkey" FOREIGN KEY ("staff_id") REFERENCES "public"."staff" ("staff_id") ON DELETE RESTRICT ON UPDATE CASCADE;