-- 저자 별 카테고리 별 매출액 집계하기

SELECT A.AUTHOR_ID, 
       A.AUTHOR_NAME, 
       B.CATEGORY, 
       SUM(B.PRICE * S.SALES) AS TOTAL_SALES
FROM AUTHOR A 
LEFT JOIN BOOK B 
    ON A.AUTHOR_ID = B.AUTHOR_ID
LEFT JOIN BOOK_SALES S 
    ON B.BOOK_ID = S.BOOK_ID
    AND YEAR(S.SALES_DATE) = 2022 -- JOIN 할 때 바로 조건 써주기
    AND MONTH(S.SALES_DATE) = 1
GROUP BY A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY
ORDER BY A.AUTHOR_ID, B.CATEGORY DESC;
