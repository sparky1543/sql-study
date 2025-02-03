-- FrontEnd 개발자 찾기

/* 언어별 개발자 분류하기와 유사한 방식 */
WITH DEV_SKILLS AS (
    SELECT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME, GROUP_CONCAT(S.CATEGORY) AS CATEGORY
    FROM DEVELOPERS D LEFT JOIN SKILLCODES S
        ON D.SKILL_CODE & S.CODE = S.CODE
    GROUP BY D.ID, D.EMAIL, D.LAST_NAME, D.FIRST_NAME
    ORDER BY ID
)

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEV_SKILLS
WHERE CATEGORY LIKE '%Front End%'
ORDER BY ID;
