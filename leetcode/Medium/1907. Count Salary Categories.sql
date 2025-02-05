-- 1907. Count Salary Categories

SELECT 'Low Salary' AS category, IF(COUNT(*) IS NULL, 0, COUNT(*)) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION ALL

SELECT 'Average Salary' AS category, IF(COUNT(*) IS NULL, 0, COUNT(*)) AS accounts_count
FROM Accounts
WHERE income between 20000 and 50000

UNION ALL

SELECT 'High Salary' AS category, IF(COUNT(*) IS NULL, 0, COUNT(*)) AS accounts_count
FROM Accounts
WHERE income > 50000;
