SELECT customer_id, SUM(total_amount) AS total_spent
FROM order_table_v2
GROUP BY customer_id
ORDER BY total_spent DESC;