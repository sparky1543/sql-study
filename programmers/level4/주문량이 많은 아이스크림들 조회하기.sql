-- 주문량이 많은 아이스크림들 조회하기

WITH FIRST_HALF_T AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL
    FROM FIRST_HALF
    GROUP BY FLAVOR
),

JULY_T AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL
    FROM JULY
    GROUP BY FLAVOR
)

SELECT F.FLAVOR
FROM FIRST_HALF_T F LEFT JOIN JULY_T J 
    ON F.FLAVOR = J.FLAVOR
ORDER BY F.TOTAL + J.TOTAL DESC
LIMIT 3;
