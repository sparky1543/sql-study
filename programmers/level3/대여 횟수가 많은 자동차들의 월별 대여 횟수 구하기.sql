-- 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기

SELECT MONTH(START_DATE) AS MONTH, CAR_ID, COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
WHERE CAR_ID IN (SELECT CAR_ID
                FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
                WHERE (YEAR(START_DATE) = 2022) AND (MONTH(START_DATE) BETWEEN 8 AND 10)
                GROUP BY CAR_ID
                HAVING COUNT(*) >= 5)
    AND (YEAR(START_DATE) = 2022) AND (MONTH(START_DATE) BETWEEN 8 AND 10) -- 조회하는 구문도 기간 조건 추가해줘야 함
GROUP BY MONTH(START_DATE), CAR_ID
ORDER BY MONTH, CAR_ID DESC;
