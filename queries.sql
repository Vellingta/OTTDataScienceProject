-- OTT Content Catalog Analytics — SQL Queries
-- Run against the cleaned `netflix` table (see exports/netflix_titles_cleaned.csv)
-- Columns used: type, year_added, rating, title, country, seasons, duration_minutes, release_year

-- 1. Content growth by year, split by Movie vs TV Show
SELECT year_added,
       type,
       COUNT(*) AS titles_added
FROM netflix
WHERE year_added IS NOT NULL
GROUP BY year_added, type
ORDER BY year_added;


-- 2. Top 5 content ratings by share of the whole catalog
SELECT rating,
       COUNT(*) AS title_count,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM netflix), 1) AS pct_of_catalog
FROM netflix
GROUP BY rating
ORDER BY title_count DESC
LIMIT 5;


-- 3. Longest-running TV shows by season count
SELECT title, country, seasons
FROM netflix
WHERE type = 'TV Show' AND seasons IS NOT NULL
ORDER BY seasons DESC
LIMIT 10;


-- 4. Average movie runtime by decade of release
SELECT (release_year / 10) * 10 AS decade,
       ROUND(AVG(duration_minutes), 1) AS avg_runtime_minutes,
       COUNT(*) AS movie_count
FROM netflix
WHERE type = 'Movie' AND duration_minutes IS NOT NULL
GROUP BY decade
ORDER BY decade;


-- 5. Which countries contribute the most TV-MA (mature) rated content
SELECT country, COUNT(*) AS mature_titles
FROM netflix
WHERE rating = 'TV-MA' AND country != 'Unknown'
GROUP BY country
ORDER BY mature_titles DESC
LIMIT 5;
