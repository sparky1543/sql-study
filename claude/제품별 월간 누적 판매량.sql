-- 제품별 월간 누적 판매량

/*
다음 테이블이 있습니다

sales (
  id INT,
  product_id INT,
  sale_date DATE,
  quantity INT
)

제품별, 월별 누적 판매량을 계산하는 SQL 쿼리를 작성하세요. 
결과는 제품 ID, 연-월, 월별 판매량, 해당 연-월까지의 누적 판매량이 포함되어야 합니다.
결과 컬럼명 : product_id, year_month, monthly_quantity, cumulative_quantity
*/

SELECT product_id, 
      DATE_FORMAT(sale_date, "%Y-%m") AS year_month,
      SUM(quantity) AS monthly_quantity,
      SUM(quantity) OVER (PARTITION BY product_id ORDER BY DATE_FORMAT(sale_date, "%Y-%m"))AS cumulative_quantity
FROM sales
GROUP BY product_id, DATE_FORMAT(sale_date, "%Y-%m")
