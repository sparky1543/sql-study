-- Placements

SELECT ss.name
FROM friends f 
    LEFT JOIN (SELECT s.id, s.name, p.salary
                          FROM students s LEFT JOIN packages p
                              ON s.id = p.id) ss
        ON f.id = ss.id
    LEFT JOIN (SELECT s.id, s.name, p.salary
                          FROM students s LEFT JOIN packages p
                              ON s.id = p.id) fs
        ON f.friend_id = fs.id
WHERE ss.salary < fs.salary
ORDER BY fs.salary;
