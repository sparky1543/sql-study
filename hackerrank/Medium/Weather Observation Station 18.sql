-- Weather Observation Station 18
/* ABS() : 절대값 함수 */

SELECT ROUND(ABS(MAX(lat_n)-MIN(lat_n)) + ABS(MAX(long_w)-MIN(long_w)),4)
FROM station;