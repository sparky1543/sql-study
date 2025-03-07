-- 언어별 개발자 분류하기

/* 서브쿼리가 길어서 WITH 구문 사용 */
WITH DEV_SKILLS AS (
    SELECT GROUP_CONCAT(S.NAME) AS NAME, GROUP_CONCAT(S.CATEGORY) AS CATEGORY, D.ID, D.EMAIL
    -- GROUP_CONCAT() 사용하면 한 아이디에 여러개 있던 컬럼이 하나로 합쳐져서 콤마로 구분됨
    FROM DEVELOPERS D LEFT JOIN SKILLCODES S
        ON D.SKILL_CODE & S.CODE = S.CODE
    GROUP BY D.ID, D.EMAIL
)

SELECT CASE
        WHEN CATEGORY LIKE '%Front End%' AND NAME LIKE '%Python%' THEN 'A'
        WHEN NAME LIKE '%C#%' THEN 'B'
        WHEN CATEGORY LIKE '%Front End%' THEN 'C'
       END AS GRADE, ID, EMAIL
FROM DEV_SKILLS
HAVING GRADE IS NOT NULL -- 별칭을 조건에 쓰고 싶으면 HAVING 절에 쓰기
ORDER BY GRADE, ID;
