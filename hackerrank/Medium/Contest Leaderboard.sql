-- Contest Leaderboard

SELECT s.hacker_id, h.name, SUM(s.score) AS score
FROM (SELECT hacker_id, challenge_id, MAX(score) AS score
      FROM submissions
      GROUP BY hacker_id, challenge_id) s
    LEFT JOIN hackers h ON s.hacker_id = h.hacker_id
GROUP BY s.hacker_id, h.name
HAVING score != 0
ORDER BY score DESC, hacker_id;
