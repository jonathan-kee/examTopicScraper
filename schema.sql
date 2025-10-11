-- As a general rule, all the columns in a unique constraint and all the columns in a foreign key constraint are best defined with not null constraints as well; this will often be a business requirement. Attempting to insert a row in the child table for which there is no matching row in the parent table will give an error --
-- You cannot use ON DELETE CASCADE or ON DELETE SET NULL constraints in duckdb --
CREATE TABLE companies
(
    name STRING,
    CONSTRAINT company_pk PRIMARY KEY (name)
);

INSERT INTO companies
    (name)
VALUES
    ('Oracle');

CREATE TABLE exams
(
    name STRING,
    company STRING NOT NULL,
    CONSTRAINT exam_pk PRIMARY KEY (name),
    CONSTRAINT exam_company_fk FOREIGN KEY (company) REFERENCES companies(name)
);

INSERT INTO exams
    (name, company)
VALUES
    ('1z0-071', 'Oracle');

CREATE TABLE questions
(
    number INT,
    exam STRING NOT NULL,
    text STRING,
    -- Each question belongs to exactly one exam, but an exam can have many questions. The combination of question number and exam must be unique. --
    -- composite primary key --
    CONSTRAINT question_pk PRIMARY KEY (number, exam),
    CONSTRAINT question_exam_fk FOREIGN KEY (exam) REFERENCES exams(name)
);

INSERT INTO questions
    (number, exam, text)
VALUES
    (1, '1z0-071', 'Which SQL statement is used to extract data from a database?');

CREATE TABLE answers
(
    number INT,
    question_number INT NOT NULL,
    question_exam STRING NOT NULL,
    text STRING,
    is_correct BOOL,
    -- Each answer belongs to exactly one question, but a question can have many answers. The combination of answer number and question (number and exam) must be unique. --
    -- composite primary key --
    CONSTRAINT answer_pk PRIMARY KEY (number, question_number, question_exam),
    CONSTRAINT answer_question_fk  FOREIGN KEY (question_number, question_exam) REFERENCES questions(number, exam)
);

INSERT INTO answers
    (number, question_number, question_exam, text, is_correct)
VALUES
    (1, 1, '1z0-071', 'SELECT', TRUE),
    (2, 1, '1z0-071', 'EXTRACT', FALSE),
    (3, 1, '1z0-071', 'OPEN', FALSE),
    (4, 1, '1z0-071', 'GET', FALSE);

MERGE INTO answers
USING (
-- Source data to be inserted or updated --
SELECT 1 AS number, 103 AS question_number, '1z0-071' AS question_exam, 'https://example.com/image1.png' AS text, FALSE AS is_correct
) AS src
-- Join condition -- 
ON answers.number = src.number AND answers.question_number = src.question_number AND answers.question_exam = src.question_exam 
-- Update existing record --
WHEN MATCHED THEN
    UPDATE SET text = src.text, is_correct = src.is_correct
-- Insert new record --    
WHEN NOT MATCHED THEN
    INSERT (number, question_number, question_exam, text, is_correct) VALUES (src.number, src.question_number, src.question_exam, src.text, src.is_correct); 


CREATE TABLE discussions
(
    number INT,
    question_number INT NOT NULL,
    question_exam STRING NOT NULL,
    selected_answer STRING,
    text string,
    upvote INT
        CONSTRAINT discussion_pk PRIMARY KEY (number, question_number, question_exam),
    CONSTRAINT discussion_question_fk FOREIGN KEY (question_number, question_exam) REFERENCES questions(number, exam)
)

INSERT INTO discussions
    (number, question_number, question_exam, selected_answer, text, upvote)
VALUES
    (1, 1, '1z0-071', 'Selected Answer: AC', 'A & C is correct', 1),
    (2, 1, '1z0-071', 'Selected Answer: AC', 'A-C is correct', 1),
    (3, 1, '1z0-071', null, 'A and C is the correct answer.', 1),
    (4, 1, '1z0-071', 'Selected Answer: AC', 'Distinct is used to get distinct set of values for one or more columns mentioned in select statement', 2);  