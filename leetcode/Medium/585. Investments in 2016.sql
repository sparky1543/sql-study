-- 585. Investments in 2016

-- 1. 같은 tiv_2015 값을 가진 다른 계약자가 있어야 한다
-- 2. 같은 도시에 있는 다른 계약자가 없어야 한다
-- 3. 위 조건을 만족하는 계약자들의 tiv_2016 값을 모두 더한 후, 소수점 둘째 자리까지 반올림

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (SELECT tiv_2015
                    FROM Insurance
                    GROUP BY tiv_2015
                    HAVING COUNT(*) > 1)
    AND CONCAT(lat, lon) IN (SELECT CONCAT(lat, lon)
                            FROM Insurance
                            GROUP BY CONCAT(lat, lon)
                            HAVING COUNT(*) = 1);
