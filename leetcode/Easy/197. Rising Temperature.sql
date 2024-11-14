-- 197. Rising Temperature
/* 어제와 비교해서 온도가 더 높은 날의 id 출력하기 SELF JOIN, 날짜 함수 */

-- 1. 날짜 함수 DATEDIFF()를 활용하여 SELF JOIN
/* DATEDIFF(date1, date2) : 두 날짜 값 사이의 일수 계산 */
SELECT A.id
FROM Weather A INNER JOIN Weather B
ON DATEDIFF(A.recordDate, B.recordDate) = 1
WHERE A.temperature > B.temperature;

-- 2. 날짜 함수 DATE_ADD()를 활용하여 SELF JOIN
/* DATE_ADD(date, INTERVAL value UNIT) : 날짜에 값만큼 유닛(일, 월, 년 등) 증가 */
SELECT A.id
FROM Weather A INNER JOIN Weather B
ON A.recordDate = DATE_ADD(B.recordDate, INTERVAL 1 DAY)
WHERE A.temperature > B.temperature;

-- 3. 날짜함수 ADDDATE()를 활용하여 SELF JOIN
/* ADDDATE(date, value) : 날짜에 값만큼 일수 증가 */
SELECT A.id
FROM Weather A INNER JOIN Weather B
ON A.recordDate = ADDDATE(B.recordDate, 1)
WHERE A.temperature > B.temperature;