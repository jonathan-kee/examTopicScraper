CREATE TABLE relative_path_questions AS
with relative_path_questions as (
    SELECT 
    number,
    exam,
    regexp_replace(
        text,
        'https?://[^/\s'']+/[^\s'']+/([^\s'']+\.[^\s'']+)',
        './images/\1',
        'g'
    ) as text
    from questions
)
select * from relative_path_questions;

CREATE TABLE relative_path_answers AS
with relative_path_answers as (
    SELECT 
    number,
    question_number,
    question_exam,
    regexp_replace(
        text,
        'https?://[^/\s'']+/[^\s'']+/([^\s'']+\.[^\s'']+)',
        './images/\1',
        'g'
    ) as text,
    is_correct
    from answers
)
select * from relative_path_answers;