-- Occupations

/*
- 먼저 각 직업별로 이름에 순위를 매기기 위해 ROW_NUMBER()를 사용함
- 이렇게 매긴 순위를 기준으로 그룹화하여, 같은 순위끼리 한 줄로 묶음
- 그런 다음 각 직업에 해당하는 사람 이름을 CASE문으로 구분해서 출력

- GROUP BY를 사용하기 때문에 SELECT절에 있는 각 컬럼은 하나의 값만 나와야 함
  그래서 CASE문 결과를 MAX()로 감싸서 '그룹 안의 유일한 값'을 안전하게 가져옴

  (실제로는 각 그룹에 값이 하나뿐이라 MAX를 안 써도 상관없어 보이지만,
   SQL 문법상 GROUP BY에는 집계 함수가 필요하므로 반드시 MAX를 써야 함)
*/

SELECT
  MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
  MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
  MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
  MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM (SELECT name, occupation,
             ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rn
      FROM occupations) AS sub
GROUP BY rn
ORDER BY rn;
