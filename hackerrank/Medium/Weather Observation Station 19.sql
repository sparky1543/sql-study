-- Weather Observation Station 19
/* POWER(밑, 지수) : 제곱 함수, SQRT() : 제곱근 함수 */

SELECT ROUND(SQRT(POWER(MAX(lat_n)-MIN(lat_n),2)+POWER(MAX(long_w)-MIN(long_w),2)),4)
FROM station;