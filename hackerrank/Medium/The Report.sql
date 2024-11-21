-- The Report

SELECT CASE 
            WHEN G.grade < 8 THEN null
            ELSE S.name
        END as name,
        G.grade, 
        S.marks
FROM students S LEFT JOIN grades G
    ON(S.marks >= min_mark AND S.marks <= max_mark)
ORDER BY G.grade desc, name;