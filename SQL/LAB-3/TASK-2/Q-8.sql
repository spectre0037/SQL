-- 5.Add a check constraint to ensure that the price of the product is greater than 0.
ALTER TABLE Product
ADD CONSTRAINT check_price_positive CHECK (price > 0);