-- 626. Exchange Seats

SELECT CASE
        WHEN (SELECT max(id) FROM Seat) = id AND id % 2 = 1 THEN id -- MAX값과 비교하고 싶으면 서브쿼리로
        WHEN id % 2 = 1 THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
       END AS id,
       student
FROM Seat
ORDER BY id;
