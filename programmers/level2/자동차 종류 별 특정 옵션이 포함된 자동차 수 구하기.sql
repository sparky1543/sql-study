-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기

SELECT CAR_TYPE, COUNT(CAR_ID) as CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS LIKE '%시트%'
GROUP BY CAR_TYPE
ORDER BY CAR_TYPE;