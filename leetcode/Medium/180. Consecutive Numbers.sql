-- 180. Consecutive Numbers

/* 윈도우 함수 사용 
LEAD(num, 1) : 현재 행 기준으로 다음 행의 num 값을 가져옴 */

WITH three AS (
    SELECT num,
        LEAD(num, 1) OVER (ORDER BY id) AS num2,
        LEAD(num, 2) OVER (ORDER BY id) AS num3
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM three
WHERE num = num2 AND num = num3; -- 별칭으로 조건쓰려면 WITH 절 안의 WHERE에 쓸 수 없음
