-- 자동차 대여 기록 별 대여 금액 구하기

/* MySQL에서는 DATEDIFF() 사용하여 날짜 차이 계산 */
WITH RENTAL AS (
    SELECT H.HISTORY_ID,
           DATEDIFF(H.END_DATE, H.START_DATE) + 1 AS RENTAL_DAYS,
           CASE
            WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(H.END_DATE, H.START_DATE) + 1 >= 7 THEN '7일 이상'    
           END AS DURATION_TYPE,
           C.DAILY_FEE,
           C.CAR_TYPE
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H LEFT JOIN CAR_RENTAL_COMPANY_CAR C
        ON H.CAR_ID = C.CAR_ID
    WHERE C.CAR_TYPE = '트럭'
)

SELECT DISTINCT R.HISTORY_ID,
    ROUND(R.RENTAL_DAYS * R.DAILY_FEE * IF(R.DURATION_TYPE IS NOT NULL, (100 - D.DISCOUNT_RATE) / 100, 1), 0) AS FEE
FROM RENTAL R LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN D
    ON R.CAR_TYPE = D.CAR_TYPE
WHERE R.DURATION_TYPE IS NULL OR R.DURATION_TYPE = D.DURATION_TYPE
ORDER BY FEE DESC, HISTORY_ID DESC;
