-- Weather Observation Station 20
/* COUNT()가 집계 함수로 인식되면 전체 행 수를 하나로 요약하지만, 
위에서 윈도우 함수로 각 행에 번호를 매기려 해서 이를 동시에 처리할 수 없기 때문에 오류 발생 */

SELECT ROUND(AVG(lat_n),4)
FROM (SELECT *, 
        ROW_NUMBER() OVER (ORDER BY lat_n) as num,
        COUNT(*) OVER () as cnt -- COUNT() 뒤에 OVER ()을 작성하지 않으면 집계함수로 인식하고 오류남
      FROM station) A
WHERE num IN (FLOOR((cnt + 1) / 2), CEIL((cnt + 1) / 2)); -- 짝수면 2개의 평균, 홀수면 1개만

/* Oracle은 MEDIAN() 함수 사용 가능
MySQL은 MEDIAN() 함수 사용 불가. PERCENT_RANK() 윈도우 함수를 사용해 퍼센트를 0.5로 설정하면 중간값을 구할 수 있음 */