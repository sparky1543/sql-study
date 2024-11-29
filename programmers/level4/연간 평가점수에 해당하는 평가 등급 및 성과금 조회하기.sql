-- 연간 평가점수에 해당하는 평가 등급 및 성과금 조회하기

/* 문제에는 안나와 있으나 사원별 평균 점수로 계산해야 한다고 함 */
SELECT E.EMP_NO, E.EMP_NAME,
       CASE WHEN AVG(G.SCORE) >= 96 THEN 'S'
            WHEN AVG(G.SCORE) >= 90 THEN 'A'
            WHEN AVG(G.SCORE) >= 80 THEN 'B'
            ELSE 'C' 
        END as GRADE,
       CASE WHEN AVG(G.SCORE) >= 96 THEN E.SAL*0.2
            WHEN AVG(G.SCORE) >= 90 THEN E.SAL*0.15
            WHEN AVG(G.SCORE) >= 80 THEN E.SAL*0.1
            ELSE 0
        END as BONUS
FROM HR_GRADE G
    LEFT JOIN HR_EMPLOYEES E ON(G.EMP_NO = E.EMP_NO)
    LEFT JOIN HR_DEPARTMENT D ON(E.DEPT_ID = D.DEPT_ID)
GROUP BY E.EMP_NO, E.EMP_NAME
ORDER BY EMP_NO;