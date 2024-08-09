CREATE TABLE "public"."film_actor" (
  "actor_id" int2 NOT NULL,
  "film_id" int2 NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."film_actor" ADD CONSTRAINT "film_actor_pkey" PRIMARY KEY ("actor_id", "film_id");

ALTER TABLE "public"."film_actor" ADD CONSTRAINT "film_actor_actor_id_fkey" FOREIGN KEY ("actor_id") REFERENCES "public"."actor" ("actor_id") ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE "public"."film_actor" ADD CONSTRAINT "film_actor_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "public"."film" ("film_id") ON DELETE RESTRICT ON UPDATE CASCADE;