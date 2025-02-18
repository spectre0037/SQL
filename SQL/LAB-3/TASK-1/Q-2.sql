CREATE TABLE order_table (
    order_id SERIAL PRIMARY KEY,
    total_amount INT NOT NULL,
    customer_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);
