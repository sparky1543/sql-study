-- 서울에 위치한 식당 목록 출력하기

SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, 
    ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO I RIGHT JOIN REST_REVIEW R 
    ON I.REST_ID = R.REST_ID 
WHERE I.ADDRESS LIKE '서울%'
GROUP BY I.REST_ID
ORDER BY SCORE DESC, FAVORITES DESC;
