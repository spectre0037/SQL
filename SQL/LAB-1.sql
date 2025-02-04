CREATE DATABASE LAB1;
CREATE TABLE LAB1 IF NOT EXISTS(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_role VARCHAR(50) NOT NULL,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);
SELECT * FROM LAB1;