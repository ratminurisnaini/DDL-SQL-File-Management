CREATE TABLE "public"."inventory" (
  "inventory_id" int4 NOT NULL DEFAULT nextval('inventory_inventory_id_seq'::regclass),
  "film_id" int2 NOT NULL,
  "store_id" int2 NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."inventory" ADD CONSTRAINT "inventory_pkey" PRIMARY KEY ("inventory_id");

ALTER TABLE "public"."inventory" ADD CONSTRAINT "inventory_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "public"."film" ("film_id") ON DELETE RESTRICT ON UPDATE CASCADE;