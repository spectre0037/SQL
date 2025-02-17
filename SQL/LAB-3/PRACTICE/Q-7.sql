-- USING GROUP BY WITH HAVING CLAUSE
SELECT DATE(registration_date),first_name
FROM users
GROUP BY registration_date,first_name
HAVING first_name = 'Alexander'
