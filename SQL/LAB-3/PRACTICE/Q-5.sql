-- USING GROUP BY WITH COUNT() FUNCTION
SELECT first_name,COUNT(user_id) FROM users GROUP BY user_id
