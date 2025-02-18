-- 9.Add a unique constraint to category name to ensure that categories are not repeated.
ALTER TABLE category_table
ADD CONSTRAINT unique_cons UNIQUE(name)