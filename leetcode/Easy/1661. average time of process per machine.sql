-- 1661. average time of process per machine
/* SELF JOIN 하는데 ON절을 이용하여 시작 시간과 끝나는 시간 분리하고 GROUP BY 후 AVG() 함수 활용하기 */

SELECT A.machine_id, ROUND(AVG(B.timestamp-A.timestamp),3) AS processing_time
FROM Activity A INNER JOIN Activity B
ON A.machine_id = B.machine_id
AND A.process_id = B.process_id
AND A.activity_type = 'start'
AND B.activity_type = 'end'
GROUP BY A.machine_id;​