-- 1204. Last Person to Fit in the Bus

SELECT person_name
FROM (SELECT person_name,
             SUM(weight) OVER (ORDER BY turn) AS total -- 누적합 구하기 위한 윈도우 함수
      FROM Queue) T
WHERE total <= 1000
ORDER BY total DESC
LIMIT 1;
