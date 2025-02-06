-- 1517. Find Users With Valid E-Mails

/* 특정 형식을 따르는지 여부 확인
- REGEXP_LIKE(mail, '...') : mail 값이 정규식과 매칭되면 TRUE, 그렇지 않으면 FALSE를 반환

- ^ : 문자열 시작을 의미
- [A-Za-z]+ : 첫 글자는 반드시 영어 대소문자 (A-Z 또는 a-z)가 최소 1개 이상 와야 함
- [A-Za-z0-9_.-]* : 그 뒤에는 알파벳, 숫자, _, ., -이 0개 이상 올 수 있음
- @leetcode : @leetcode라는 고정된 문자열을 포함해야 함
- [.] : .은 정규식에서 "임의의 문자"로 해석되므로, 문자 그대로 해석하려면 [] 또는 \. 사용
- com : 반드시 com으로 끝나야 함
- $ : 문자열 끝을 의미 (뒤에 더 이상 문자가 오면 안 됨)
*/
SELECT * FROM Users 
WHERE REGEXP_LIKE(mail, '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode[.]com$');
