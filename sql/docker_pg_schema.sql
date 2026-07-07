-- Run this first before docker_pg_seq_schema.sql --

CREATE TABLE companies
(
    name TEXT,
    CONSTRAINT company_pk PRIMARY KEY (name)
);

CREATE TABLE exams
(
    name TEXT,
    company TEXT NOT NULL,
    CONSTRAINT exam_pk PRIMARY KEY (name),
    CONSTRAINT exam_company_fk FOREIGN KEY (company) REFERENCES companies(name) ON DELETE CASCADE
);

CREATE TABLE questions
(
    number INT,
    exam TEXT NOT NULL,
    text TEXT,
    CONSTRAINT question2_pk PRIMARY KEY (number, exam),
    CONSTRAINT question2_exam_fk FOREIGN KEY (exam) REFERENCES exams(name) ON DELETE CASCADE
);

CREATE TABLE answers
(
    number INT,
    question_number INT NOT NULL,
    question_exam TEXT NOT NULL,
    text TEXT,
    is_correct BOOLEAN,
    CONSTRAINT answer_pk PRIMARY KEY (number, question_number, question_exam),
    CONSTRAINT answer_question_fk FOREIGN KEY (question_number, question_exam)
        REFERENCES questions(number, exam) ON DELETE CASCADE
);

CREATE TABLE discussions
(
    number INT,
    question_number INT NOT NULL,
    question_exam TEXT NOT NULL,
    selected_answer TEXT,
    text TEXT,
    upvote INT,
    CONSTRAINT discussion_pk PRIMARY KEY (number, question_number, question_exam),
    CONSTRAINT discussion_question_fk FOREIGN KEY (question_number, question_exam)
        REFERENCES questions(number, exam) ON DELETE CASCADE
);