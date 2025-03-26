-- SQL Project Planning

/*
- 연속된 날짜 여부를 판단하여, 연속되는 경우 tf를 1로 표시 (첫 행은 0)
- tf가 1인 경우 그룹 번호를 유지하고, 0인 경우 새로운 그룹 번호를 부여하여 group_id 생성
- group_id로 그룹화하여 각 프로젝트의 시작일(MIN)과 종료일(MAX)을 계산

- 프로젝트 기간이 짧은 순으로 정렬
- ORDER BY는 그룹화 뒤에 등장하므로 COUNT 사용 가능
*/

SELECT MIN(start_date) AS start_date, MAX(end_date) AS end_date
FROM (SELECT start_date, end_date, SUM(IF(tf = 0, 1, 0)) OVER (ORDER BY start_date) AS group_id
      FROM (SELECT start_date, end_date, IF(DATEDIFF(LAG(end_date) OVER (ORDER BY start_date), start_date)=0, 1, 0) AS tf
            FROM projects) p) g
GROUP BY group_id
ORDER BY COUNT(group_id), start_date;
