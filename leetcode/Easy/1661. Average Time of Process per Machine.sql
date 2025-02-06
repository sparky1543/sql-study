-- 1661. Average Time of Process per Machine

/* 셀프조인 */
SELECT S.machine_id, ROUND(AVG(E.timestamp-S.timestamp), 3) AS processing_time
FROM (SELECT * FROM Activity WHERE activity_type = 'start') S
    LEFT JOIN (SELECT * FROM Activity WHERE activity_type = 'end') E
    ON S.machine_id = E.machine_id AND S.process_id = E.process_id
GROUP BY S.machine_id;
