-- 196. Delete Duplicate Emails
/* 중복 이메일이 있으면 id가 가장 작은 하나의 이메일만 남기고 삭제 DELETE, SELF JOIN */

DELETE A FROM Person A, Person B
WHERE A.email = B.email and A.id > B.id;