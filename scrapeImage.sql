with image_url_questions as (
	SELECT regexp_matches(
	  text,
	  'https://www\.examtopics\.com/[^ ]+\.png',
	  'g'
	) AS url
	FROM questions
	WHERE text LIKE '%https://www.examtopics.com/%'
),
image_url_answers as (
	SELECT regexp_matches(
		  text,
		  'https://www\.examtopics\.com/[^ ]+\.png',
		  'g'
		) AS url
	FROM answers
	WHERE text like '%https://www.examtopics.com/%'
)

select * from image_url_questions
union all
select * from image_url_answers;