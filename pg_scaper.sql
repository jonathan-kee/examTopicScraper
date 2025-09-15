CREATE TABLE questionsLink (
    number INT,
    exam TEXT NOT NULL,
    link TEXT,
    CONSTRAINT question_pk PRIMARY KEY (number, exam)
);

CREATE SEQUENCE seq_questionsLink START WITH 1 INCREMENT BY 1;

INSERT INTO questionsLink (number, exam, link) 
VALUES (nextval('seq_questionsLink'), '1z0-071', 'https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/');
