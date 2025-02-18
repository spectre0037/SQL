-- 8.Count the number of products in each category.
SELECT category_id, COUNT(*)AS product_count
from product
GROUP BY category_id