SELECT product_id, AVG(quantity) AS avg_order_quantity
FROM order_table_v2
GROUP BY product_id
HAVING AVG(quantity) > 10;
