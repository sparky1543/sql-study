-- New Companies

/*
- hackerrank의 MySQL 버전: 5.7.27 (WITH 구문 사용 불가)
*/

SELECT c.company_code, c.founder, l.lc, s.sc, m.mc, e.ec
FROM company c
    LEFT JOIN (
        SELECT COUNT(DISTINCT lead_manager_code) AS lc, company_code
        FROM lead_manager
        GROUP BY company_code
    ) l ON(l.company_code = c.company_code)
    LEFT JOIN (
        SELECT COUNT(DISTINCT senior_manager_code) AS sc, company_code
        FROM senior_manager
        GROUP BY company_code
    ) s ON(s.company_code = c.company_code)
    LEFT JOIN (
        SELECT COUNT(DISTINCT manager_code) AS mc, company_code
        FROM manager
        GROUP BY company_code
    ) m ON(m.company_code = c.company_code)
    LEFT JOIN (
        SELECT COUNT(DISTINCT employee_code) AS ec, company_code
        FROM employee
        GROUP BY company_code
    ) e ON(e.company_code = c.company_code)
ORDER BY c.company_code;
