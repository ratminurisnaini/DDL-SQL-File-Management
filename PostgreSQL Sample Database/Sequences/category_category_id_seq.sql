CREATE SEQUENCE "public"."category_category_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

SELECT setval('"public"."category_category_id_seq"', 17, true);