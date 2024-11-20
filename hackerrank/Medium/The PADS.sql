-- The PADS
/* Oracle은 ||를 주로 사용했는데 Mysql에서는 사용 불가
대신 CONCAT() 함수 안에 콤마(,)로 작성 가능 */

SELECT CONCAT(name, '(', LEFT(occupation, 1), ')') AS names
FROM occupations

UNION ALL

SELECT CONCAT('There are a total of ', COUNT(occupation), ' ', LOWER(occupation), 's.') as names
FROM occupations
GROUP BY occupation
ORDER BY names;