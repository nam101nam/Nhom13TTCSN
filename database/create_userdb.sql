USE userdb;
DROP TABLE IF EXISTS users;  

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL ,  
    username VARCHAR(50),
    password VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20) UNIQUE 
);