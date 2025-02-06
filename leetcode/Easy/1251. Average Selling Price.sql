-- 1251. Average Selling Price

SELECT P.product_id, 
        IFNULL(ROUND(SUM(U.units*P.price)/SUM(U.units),2),0) AS average_price -- 판매가 없는 경우도 고려
FROM Prices P LEFT JOIN UnitsSold U
    ON P.product_id = U.product_id
    AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;
