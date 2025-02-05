-- 602. Friend Requests II: Who Has the Most Friends

SELECT requester_id AS id, COUNT(*) AS num
FROM (SELECT requester_id, accepter_id
        FROM RequestAccepted
        UNION
        SELECT accepter_id AS requester_id, requester_id AS accepter_id
        FROM RequestAccepted) U
GROUP BY requester_id
ORDER BY num DESC
LIMIT 1;
