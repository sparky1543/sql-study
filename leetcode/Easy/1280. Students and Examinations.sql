-- 1280. Students and Examinations
/* 처음엔 Subjects 테이블을 사용안하고 풀 수 있나 했는데 0도 출력하기 위해서 CROSS JOIN할 때 사용
COUNT 할 때, Examinations 테이블의 student_id로 해야 제대로 카운트됨 */

SELECT A.student_id, A.student_name, B.subject_name, COUNT(C.student_id) AS attended_exams
FROM Students A CROSS JOIN Subjects B LEFT JOIN Examinations C
ON A.student_id = C.student_id AND B.subject_name = C.subject_name
GROUP BY student_id, student_name, subject_name
ORDER BY student_id, subject_name;