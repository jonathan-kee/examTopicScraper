CREATE TABLE companies
(
    name TEXT,
    CONSTRAINT company_pk PRIMARY KEY (name)
);

INSERT INTO companies (name) VALUES ('Oracle');

CREATE TABLE exams
(
    name TEXT,
    company TEXT NOT NULL,
    CONSTRAINT exam_pk PRIMARY KEY (name),
    CONSTRAINT exam_company_fk FOREIGN KEY (company) REFERENCES companies(name)
);

INSERT INTO exams (name, company) VALUES ('1z0-071', 'Oracle');

CREATE TABLE questions
(
    number INT,
    exam TEXT NOT NULL,
    text TEXT,
    CONSTRAINT question2_pk PRIMARY KEY (number, exam),
    CONSTRAINT question2_exam_fk FOREIGN KEY (exam) REFERENCES exams(name)
);

INSERT INTO questions (number, exam, text)
VALUES (1, '1z0-071', 'Which SQL statement is used to extract data from a database?');

CREATE TABLE answers
(
    number INT,
    question_number INT NOT NULL,
    question_exam TEXT NOT NULL,
    text TEXT,
    is_correct BOOLEAN,
    CONSTRAINT answer_pk PRIMARY KEY (number, question_number, question_exam),
    CONSTRAINT answer_question_fk FOREIGN KEY (question_number, question_exam)
        REFERENCES questions(number, exam)
);

INSERT INTO answers (number, question_number, question_exam, text, is_correct)
VALUES
    (1, 1, '1z0-071', 'SELECT', true),
    (2, 1, '1z0-071', 'EXTRACT', false),
    (3, 1, '1z0-071', 'OPEN', false),
    (4, 1, '1z0-071', 'GET', false);

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
        REFERENCES questions(number, exam)
);

INSERT INTO discussions (number, question_number, question_exam, selected_answer, text, upvote)
VALUES
    (1, 1, '1z0-071', 'Selected Answer: AC', 'A & C is correct', 1),
    (2, 1, '1z0-071', 'Selected Answer: AC', 'A-C is correct', 1),
    (3, 1, '1z0-071', null, 'A and C is the correct answer.', 1),
    (4, 1, '1z0-071', 'Selected Answer: AC',
        'Distinct is used to get distinct set of values for one or more columns mentioned in select statement',
        2);

CREATE SEQUENCE seq_questions START WITH 1 INCREMENT BY 1;
SELECT last_value FROM seq_questions;
SELECT nextval('seq_questions') as next_value;