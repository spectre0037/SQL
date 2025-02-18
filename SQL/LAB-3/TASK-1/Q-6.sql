SELECT customer_id,total_amount
FROM order_table
GROUP BY customer_id,total_amount
HAVING total_amount >1000
