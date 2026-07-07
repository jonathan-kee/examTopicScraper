INSERT INTO companies (name) VALUES ('Oracle');

INSERT INTO exams (name, company) VALUES ('1z0-071', 'Oracle');

INSERT INTO questions (number, exam, text)
VALUES (1, '1z0-071', 'Which SQL statement is used to extract data from a database?');

INSERT INTO answers (number, question_number, question_exam, text, is_correct)
VALUES
    (1, 1, '1z0-071', 'SELECT', true),
    (2, 1, '1z0-071', 'EXTRACT', false),
    (3, 1, '1z0-071', 'OPEN', false),
    (4, 1, '1z0-071', 'GET', false);

INSERT INTO discussions (number, question_number, question_exam, selected_answer, text, upvote)
VALUES
    (1, 1, '1z0-071', 'Selected Answer: AC', 'A & C is correct', 1),
    (2, 1, '1z0-071', 'Selected Answer: AC', 'A-C is correct', 1),
    (3, 1, '1z0-071', null, 'A and C is the correct answer.', 1),
    (4, 1, '1z0-071', 'Selected Answer: AC',
        'Distinct is used to get distinct set of values for one or more columns mentioned in select statement',
        2);