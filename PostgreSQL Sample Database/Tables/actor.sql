CREATE TABLE "public"."actor" (
  "actor_id" int4 NOT NULL DEFAULT nextval('actor_actor_id_seq'::regclass),
  "first_name" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(45) COLLATE "pg_catalog"."default" NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."actor" ADD CONSTRAINT "actor_pkey" PRIMARY KEY ("actor_id");