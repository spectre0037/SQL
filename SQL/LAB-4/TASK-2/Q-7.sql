-- 4.Alter the table and enforce unique constraint on product_id and name.
ALTER TABLE Product
ADD CONSTRAINT unique_product UNIQUE (product_id, name);
