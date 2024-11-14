-- 550. Game Play Analysis IV
/* 플레이어별 (로그인 날짜 - 1)한 날짜가 최초 로그인 날짜인지를 확인하면 됨
전체 플레이어를 COUNT할 때 player_id의 중복을 고려해야 함 */

SELECT ROUND(COUNT(*)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM Activity
WHERE (player_id, ADDDATE(event_date,-1))
        IN (SELECT player_id, MIN(event_date) FROM Activity GROUP BY player_id);