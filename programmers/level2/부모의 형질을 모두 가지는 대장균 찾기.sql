-- 부모의 형질을 모두 가지는 대장균 찾기

/* 비트 연산자 활용 */
SELECT E.ID, E.GENOTYPE, P.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA E LEFT JOIN ECOLI_DATA P
    ON(E.PARENT_ID = P.ID)
WHERE E.GENOTYPE & P.GENOTYPE >= P.GENOTYPE
ORDER BY ID;
