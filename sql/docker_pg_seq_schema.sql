-- Run this after docker_pg_schema.sql --

CREATE SEQUENCE seq_questions START WITH 1 INCREMENT BY 1;
SELECT last_value FROM seq_questions;
SELECT nextval('seq_questions') as next_value;