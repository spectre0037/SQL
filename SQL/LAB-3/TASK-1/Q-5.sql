SELECT customer_id, SUM(total_amount)
FROM order_table
GROUP BY customer_id
-- SELECT * FROM order_table