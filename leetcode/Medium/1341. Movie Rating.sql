-- 1341. Movie Rating

WITH CNT AS (
    SELECT user_id, COUNT(*) AS cnt
    FROM MovieRating
    GROUP BY user_id
),
RATE AS (
    SELECT movie_id, AVG(rating) AS rate
    FROM MovieRating
    WHERE YEAR(created_at) = 2020 AND MONTH(created_at) = 2 -- WHERE은 GROUP BY 앞에
    GROUP BY movie_id
)

(SELECT U.name as results
FROM Users U RIGHT JOIN (SELECT user_id
                        FROM CNT
                        WHERE cnt = (SELECT MAX(cnt) FROM CNT)) C
            ON U.user_id = C.user_id
ORDER BY U.name
LIMIT 1) -- UNION 할 때 LIMIT 쓸거면 괄호로 서브쿼리 만들어줘야 함

UNION ALL

(SELECT M.title as results
FROM Movies M RIGHT JOIN (SELECT movie_id
                        FROM RATE
                        WHERE rate = (SELECT MAX(rate) FROM RATE)) R
            ON M.movie_id = R.movie_id
ORDER BY M.title
LIMIT 1);
