-- 185. Department Top Three Salaries

/* 윈도우 함수 RANK, DENSE_RANK 
- RANK : 동일한 값이면 같은 순위를 부여하지만, 다음 순위는 건너뜀
- DENSE_RANK : 동일한 값이면 같은 순위를 부여하지만, 다음 순위를 건너뛰지 않음
*/
WITH Rnk AS (
    SELECT id, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS num 
                              -- PARTITION BY : 윈도우 함수의 GROUP BY 같은 느낌
    FROM Employee
)
SELECT D.name AS Department, E.name AS Employee, E.salary AS Salary
FROM Employee E LEFT JOIN Department D
    ON E.departmentId = D.id
WHERE E.id IN(SELECT id
              FROM Rnk
              WHERE num <= 3);
