-- 입양 시각 구하기(2)

/* 시각을 다 출력해야 하기 때문에 재귀쿼리 사용 */
WITH RECURSIVE hours AS (
    SELECT 0 AS hour
    UNION ALL
    SELECT hour + 1
    FROM hours
    WHERE hour < 23
)

/* 재귀쿼리랑 JOIN 해서 사용 */
SELECT H.hour, IF(A.count IS NULL, 0, A.count)
FROM hours H 
    LEFT JOIN (SELECT HOUR(DATETIME) as hour, COUNT(ANIMAL_ID) as count
               FROM ANIMAL_OUTS
               GROUP BY hour) A
    ON(H.hour = A.hour);