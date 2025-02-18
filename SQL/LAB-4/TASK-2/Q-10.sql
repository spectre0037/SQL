--7. Retrieve the data from both the tables together using join. 
SELECT 
    product.product_id,
    product.name AS product_name,
    product.price,
    product.quantity_in_stock,
    category_table.category_id,
    category_table.name AS category_name
FROM product
JOIN category_table ON product.category_id = category_table.category_id;

