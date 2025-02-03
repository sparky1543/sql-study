-- 물고기 종류 별 대어 찾기

SELECT I.ID, N.FISH_NAME, I.LENGTH
FROM FISH_INFO I LEFT JOIN FISH_NAME_INFO N
    ON I.FISH_TYPE = N.FISH_TYPE
WHERE (I.FISH_TYPE, I.LENGTH) IN (SELECT FISH_TYPE, MAX(LENGTH) -- 여러개 묶어서도 조건 가능
                                    FROM FISH_INFO
                                    GROUP BY FISH_TYPE)
