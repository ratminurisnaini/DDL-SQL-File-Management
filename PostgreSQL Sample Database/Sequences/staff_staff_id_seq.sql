CREATE SEQUENCE "public"."staff_staff_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

SELECT setval('"public"."staff_staff_id_seq"', 3, true);