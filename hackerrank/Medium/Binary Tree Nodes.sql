-- Binary Tree Nodes
/* Root는 P가 null, Leaf는 P에 존재하지 않음, Inner는 그 외 나머지 */

SELECT N, CASE
           WHEN P IS NULL THEN 'Root'
           WHEN N NOT IN (SELECT DISTINCT P 
                          FROM BST 
                          WHERE P IS NOT NULL) THEN 'Leaf'
           ELSE 'Inner'
       END AS type
FROM BST
ORDER BY N;