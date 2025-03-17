CREATE DATABASE LAB1;
CREATE TABLE credentials IF NOT EXISTS(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_password VARCHAR(50) NOT NULL,
    user_role VARCHAR(50) NOT NULL,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

SELECT * FROM LAB1;

CREATE TABLE roles(
 role_id serial PRIMARY KEY,
 role_name VARCHAR (255) UNIQUE NOT NULL
);
SELECT * FROM roles;

CREATE TABLE account_roles (
 user_id INT NOT NULL,
 role_id INT NOT NULL,
 grant_date TIMESTAMP,
 PRIMARY KEY (user_id, role_id),
 FOREIGN KEY (role_id)
 REFERENCES roles (role_id),
 FOREIGN KEY (user_id)
 REFERENCES credentials (userid)
);

ALTER TABLE account_roles RENAME TO credientials_roles


INSERT INTO credientials(username,password,email,created_on,last_login)
VALUES('user1','sesquipidel','abz@gmailcom',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP)

SELECT * FROM credientials;
