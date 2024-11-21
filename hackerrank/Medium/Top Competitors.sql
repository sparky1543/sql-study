-- Top Competitors

SELECT H.hacker_id, H.name
FROM Submissions S 
    LEFT JOIN Challenges C ON(S.challenge_id = C.challenge_id)
    LEFT JOIN Difficulty D ON(C.difficulty_level = D.difficulty_level)
    LEFT JOIN Hackers H ON(S.hacker_id=H.hacker_id)
WHERE D.score = S.score
GROUP BY H.hacker_id, H.name -- 둘다 GROUP BY 안하면 출력시 오류
HAVING COUNT(H.hacker_id) >= 2
ORDER BY COUNT(H.hacker_id) desc, H.hacker_id;