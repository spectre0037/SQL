-- USING GROUP BY WITH SUM() FUNCTION
SELECT first_name,SUM(user_id) FROM users GROUP BY user_id
