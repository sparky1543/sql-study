-- 특정 조건을 만족하는 물고기별 수와 최대 길이 구하기

SELECT COUNT(ID) AS FISH_COUNT, MAX(LENGTH) AS MAX_LENGTH, FISH_TYPE
FROM FISH_INFO
WHERE FISH_TYPE IN (SELECT FISH_TYPE
                    FROM FISH_INFO
                    GROUP BY FISH_TYPE
                    HAVING AVG(IF(LENGTH IS NULL, 10, LENGTH)) >= 33)
GROUP BY FISH_TYPE
ORDER BY FISH_TYPE;
