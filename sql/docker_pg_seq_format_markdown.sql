CREATE SEQUENCE seq_markdown START WITH 1 INCREMENT BY 1;
SELECT last_value FROM seq_markdown;
SELECT nextval('seq_markdown') as next_value;