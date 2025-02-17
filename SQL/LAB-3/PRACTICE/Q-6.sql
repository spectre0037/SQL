-- USING GROUP BY WITH MULTIPLE COLUMNS
SELECT DATE(registration_date),first_name
FROM users
GROUP BY registration_date,first_name
ORDER BY registration_date 
