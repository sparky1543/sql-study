-- 1934. Confirmation Rate
/* IF와 그룹 함수를 적절히 활용하기
IF문을 사용해서 'confirmed' 인 것만 더해서 평균내면 확인 비율 구할 수 있음 */

SELECT A.user_id, ROUND(AVG(IF(B.action='confirmed',1,0)),2) AS confirmation_rate
FROM Signups A LEFT JOIN Confirmations B
ON A.user_id = B.user_id
GROUP BY user_id;