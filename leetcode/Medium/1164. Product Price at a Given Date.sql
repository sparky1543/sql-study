-- 1164. Product Price at a Given Date

SELECT DISTINCT P.product_id, IF(M.new_price IS NULL, 10, M.new_price) AS price
FROM Products P
    LEFT JOIN (SELECT product_id, new_price
                FROM Products
                WHERE (product_id, change_date) IN (SELECT product_id, MAX(change_date)
                                                    FROM Products
                                                    WHERE change_date <= '2019-08-16'
                                                    GROUP BY product_id)) M
    ON P.product_id = M.product_id;
