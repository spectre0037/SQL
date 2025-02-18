SELECT customer_id, COUNT(order_id) AS total_orders
FROM order_table
GROUP BY customer_id
HAVING COUNT(customer_id) > 5;