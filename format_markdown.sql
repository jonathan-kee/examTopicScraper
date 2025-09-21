-- questions for question 1
select questions.number , questions.text
from relative_path_questions as questions
where questions.number = 1;

-- answers for question 1
select REPLACE(answers.text, 'Most Voted', '') as text, answers.is_correct
from relative_path_questions as questions
join relative_path_answers as answers 
on answers.question_number = questions.number and
answers.question_exam = questions.exam
where questions.number = 1;

-- discussions for question 1, top 5 by upvote
select discussions.selected_answer, discussions.text, discussions.upvote
from relative_path_questions as questions
join discussions
on discussions.question_number = questions.number and
discussions.question_exam = questions.exam
where questions.number = 1
order by upvote desc
limit 5;

CREATE SEQUENCE seq_markdown START WITH 1 INCREMENT BY 1;
SELECT last_value FROM seq_markdown;
SELECT nextval('seq_markdown') as next_value;