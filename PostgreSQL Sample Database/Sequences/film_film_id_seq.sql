CREATE SEQUENCE "public"."film_film_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

SELECT setval('"public"."film_film_id_seq"', 1001, true);