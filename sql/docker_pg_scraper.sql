-- Run this first before docker_pg_seq_scraper.sql --

CREATE TABLE questionsLink (
    number INT,
    exam TEXT NOT NULL,
    link TEXT,
    CONSTRAINT question_pk PRIMARY KEY (number, exam)
);