-- USING GROUP BY WITH DATE COLUMNS
SELECT DATE(registration_date),first_name
FROM users
GROUP BY registration_date,first_name
ORDER BY registration_date 
