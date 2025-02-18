-- 6.Alter the table and delete all products whose quantity_in_stock is less than or equal to 0.
DELETE FROM Product
WHERE quantity_in_stock <= 0;