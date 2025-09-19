CREATE OR REPLACE VIEW view_all_images_url AS 
with image_url_questions as (
	SELECT regexp_matches(
	  text,
	  'https://www\.examtopics\.com/[^\s'']+\.png',
	  'g'
	) AS url
	FROM questions
	WHERE text LIKE '%https://www.examtopics.com/%'
),
image_url_answers as (
	SELECT regexp_matches(
		  text,
		  'https://www\.examtopics\.com/[^\s'']+\.png',
		  'g'
		) AS url
	FROM answers
	WHERE text like '%https://www.examtopics.com/%'
),
all_image_url as (
	select unnest(url) from image_url_questions
	union
	select unnest(url) from image_url_answers
	order by unnest
)
SELECT * 
FROM all_image_url
ORDER BY unnest;