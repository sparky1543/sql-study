-- 1484. Group Sold Products By The Date

/* GROUP_CONCAT 안에 ORDER BY 쓰는 방법 있음 */
SELECT sell_date, COUNT(*) AS num_sold, GROUP_CONCAT(product ORDER BY product) AS products
FROM (SELECT DISTINCT * FROM Activities) A
GROUP BY sell_date;
