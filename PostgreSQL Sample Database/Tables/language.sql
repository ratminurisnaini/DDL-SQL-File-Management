CREATE TABLE "public"."language" (
  "language_id" int4 NOT NULL DEFAULT nextval('language_language_id_seq'::regclass),
  "name" char(20) COLLATE "pg_catalog"."default" NOT NULL,
  "last_update" timestamp(6) NOT NULL DEFAULT now()
)
;

ALTER TABLE "public"."language" ADD CONSTRAINT "language_pkey" PRIMARY KEY ("language_id");