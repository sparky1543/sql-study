-- 직원별 이동 평균 급여 계산

/*
다음 테이블이 있습니다.

employee_salary (
  id INT,
  employee_id INT,
  payment_date DATE,
  salary DECIMAL(10,2)
)

직원별로 최근 3개월 이동 평균 급여를 계산하는 SQL 쿼리를 작성하세요.
각 직원의 급여 기록과 함께 해당 월과 이전 2개월의 평균 급여를 표시해야 합니다.
결과 컬럼명: employee_id, payment_date, salary, moving_avg_salary
*/

SELECT employee_id, payment_date, salary,
       AVG(salary) OVER (PARTITION BY employee_id ORDER BY payment_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
FROM employee_salary;
