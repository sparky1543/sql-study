-- 1321. Restaurant Growth

/* 7일간의 이동 평균 구하기
- 더한 날짜가 7일이 아니면 조회에서 제외(CNT)
- 같은 날에 다른 손님이 방문한 건 합산해서 계산(GROUP BY) */

WITH Seven AS (
    SELECT visited_on,
            SUM(amount) OVER (ORDER BY visited_on
                            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
            ROUND(AVG(amount) OVER (ORDER BY visited_on
                            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS average_amount,
            COUNT(*) OVER (ORDER BY visited_on
                           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS cnt
    FROM (SELECT visited_on, SUM(amount) AS amount
          FROM Customer
          GROUP BY visited_on) C
)
SELECT visited_on, amount, average_amount
FROM Seven
WHERE cnt = 7
ORDER BY visited_on;
