-- Challenges

/*
- COUNT 값이 중복일 경우 모두 제거. 단,COUNT 값이 MAX면 중복이어도 그대로 두기
- WHERE 절에서는 별칭이나 COUNT를 사용할 수 없기 때문에 HAVING 절에서 처리
*/

SELECT c.hacker_id, h.name, COUNT(*) AS challenges_created
FROM challenges c LEFT JOIN hackers h ON c.hacker_id = h.hacker_id
GROUP BY c.hacker_id, h.name
HAVING COUNT(*) IN(
    SELECT MAX(challenges_created)
    FROM (SELECT hacker_id, COUNT(*) AS challenges_created
            FROM challenges
            GROUP BY hacker_id) mc
    UNION ALL
    SELECT challenges_created
    FROM (SELECT hacker_id, COUNT(*) AS challenges_created
            FROM challenges
            GROUP BY hacker_id) dstc
    GROUP BY challenges_created
    HAVING COUNT(challenges_created) = 1
)
ORDER BY challenges_created DESC, hacker_id;
