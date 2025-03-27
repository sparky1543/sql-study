-- 사용자 리텐션 분석

/*
다음 테이블이 있습니다.

user_activity (
  id INT,
  user_id INT,
  first_login_date DATE,
  activity_date DATE
)

각 사용자의 첫 가입 코호트(월 기준)별로 30일 리텐션 비율을 계산하는 SQL 쿼리를 작성하세요. 
리텐션은 첫 로그인 후 30일 내에 다시 활동한 사용자의 비율을 의미합니다.
결과 컬럼명: cohort_month, total_users, retained_users, retention_rate
*/

SELECT t.cohort_month, t.total_users, r.retained_users,
			r.retained_users/t.total_users*100 AS retention_rate
FROM (SELECT 
				DATE_FORMAT(first_login_date, '%Y-%m') AS cohort_month, 
				COUNT(DISTINCT user_id) AS total_users
			FROM user_activity
			GROUP BY DATE_FORMAT(first_login_date, '%Y-%m')) t
		
			LEFT JOIN
		
			(SELECT
					DATE_FORMAT(first_login_date, '%Y-%m') AS cohort_month, 
					COUNT(DISTINCT user_id) AS retained_users
			FROM user_activity
			WHERE DATEDIFF(activity_date, first_login_date) BETWEEN 1 AND 30
			GROUP BY DATE_FORMAT(first_login_date, '%Y-%m')) r
			ON t.cohort_month = r.cohort_month;
