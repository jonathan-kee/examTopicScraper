-- questions for question 1
select questions.number , questions.text
from relative_path_questions as questions
where questions.number = 1

-- answers for question 1
select answers.text, answers.is_correct
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
limit 5