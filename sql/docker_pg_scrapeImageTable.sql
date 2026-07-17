CREATE TABLE all_images_url AS 
with image_url_questions as (
	SELECT regexp_matches(
		text,
		'https?://[^/\s'']+/[^\s'']+\.[^\s'']+',
		'g'
	) AS url
	FROM questions
),
image_url_answers as (
	SELECT regexp_matches(
		text,
		'https?://[^/\s'']+/[^\s'']+\.[^\s'']+',
		'g'
	) AS url
	FROM answers
),
all_image_url as (
	select unnest(url) from image_url_questions
	union
	select unnest(url) from image_url_answers
	order by unnest
)
SELECT 
	DENSE_RANK() OVER (ORDER BY unnest) as number,
	unnest as url
FROM all_image_url
ORDER BY unnest;


UPDATE all_images_url
SET url = REPLACE(url, 'pngMost', 'png')
WHERE url LIKE '%pngMost%';