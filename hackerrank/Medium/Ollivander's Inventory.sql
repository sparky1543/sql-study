-- Ollivander's Inventory

/*
- 이미 is_evil=0 만 추출하기 때문에 LEFT JOIN이 아닌 INNER JOIN이어도 괜찮다
*/

SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands w 
    JOIN wands_property wp ON w.code = wp.code
WHERE wp.is_evil = 0
    AND (wp.age, w.coins_needed, w.power) IN (SELECT wp.age, MIN(w.coins_needed), w.power
                                                FROM wands w 
                                                    JOIN wands_property wp ON w.code = wp.code
                                                WHERE wp.is_evil = 0
                                                GROUP BY wp.age, w.power)
ORDER BY power DESC, age DESC;
