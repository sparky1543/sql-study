-- 월별 활성 사용자 분석

/*
다음 테이블이 있습니다.

user_logins (
  id INT,
  user_id INT,
  login_date DATE,
  platform VARCHAR(20)
)

월별 활성 사용자(MAU)와 각 플랫폼별 사용자 분포를 계산하는 SQL 쿼리를 작성하세요.
결과는 연-월, MAU, 웹 사용자 수, 모바일 사용자 수, 그리고 모바일 사용자 비율(%)을 포함해야 합니다.
결과 컬럼명: year_month, mau, web_users, mobile_users, mobile_percentage
*/

SELECT 
    DATE_FORMAT(login_date, '%Y-%m') AS year_month,
    COUNT(DISTINCT user_id) AS mau,
    COUNT(DISTINCT CASE WHEN platform = 'web' THEN user_id END) AS web_users,
    COUNT(DISTINCT CASE WHEN platform = 'mobile' THEN user_id END) AS mobile_users,
    COUNT(DISTINCT CASE WHEN platform = 'mobile' THEN user_id END) / COUNT(DISTINCT user_id) * 100 AS mobile_percentage
FROM 
    user_logins
GROUP BY 
    DATE_FORMAT(login_date, '%Y-%m');
