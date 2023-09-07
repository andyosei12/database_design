-- CREATE DATABASE inventory;
-- USE inventory;

-- creating database tables

-- CREATE TABLE Categories (
-- id BIGINT,
-- name VARCHAR(30) unique,
-- PRIMARY KEY (id)
-- );

-- CREATE TABLE Products (
-- id BIGINT,
-- name varchar(50),
-- price FLOAT8,
-- size ENUM('small','medium','large'),
-- image_url VARCHAR(255),
-- description VARCHAR(255),
-- status ENUM('active','inactive') DEFAULT 'active',
-- category_id BIGINT,
-- PRIMARY KEY (id),
-- FOREIGN KEY (category_id) REFERENCES Categories(id)
-- );

-- CREATE TABLE Roles (
-- id BIGINT,
-- title VARCHAR(10),
-- PRIMARY KEY (id)
-- );

-- CREATE TABLE Users (
-- id BIGINT,
-- name VARCHAR(50),
-- address VARCHAR(100),
-- contact VARCHAR(30) unique,
-- email VARCHAR(30) unique,
-- password VARCHAR(30),
-- role_id BIGINT,
-- PRIMARY KEY (id),
-- FOREIGN KEY (role_id) REFERENCES Roles (id)
-- );

-- CREATE TABLE Admins (
-- id BIGINT,
-- user_id BIGINT,
-- role_id BIGINT,
-- PRIMARY KEY (id),
-- FOREIGN KEY (role_id) REFERENCES Roles (id),
-- FOREIGN KEY (user_id) REFERENCES Users (id)
-- );

-- CREATE TABLE Orders (
-- id BIGINT,
-- user_id BIGINT,
-- status ENUM('approved','rejected'),
-- total FLOAT8,
-- updated_by BIGINT,
-- created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- PRIMARY KEY (id),
-- FOREIGN KEY (user_id) REFERENCES Users (id),
-- FOREIGN KEY (updated_by) REFERENCES Admins (id)
-- );

-- CREATE TABLE OrderDetails (
-- id BIGINT,
-- order_id BIGINT,
-- product_id BIGINT,
-- quantity INT,
-- created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- PRIMARY KEY (id),
-- FOREIGN KEY (order_id) REFERENCES Orders (id),
-- FOREIGN KEY (product_id) REFERENCES Products (id)
-- );

-- SHOW TABLES;

-- inserting into tables
-- INSERT INTO Categories (id,name)
-- VALUES
-- (1,'shirts'),
-- (2,'trousers'),
-- (3,'shoes');

-- INSERT INTO Products (id,name,price,size,image_url,description,category_id)
-- VALUES
-- (1,'demi jeans',30.99,'medium','https://image.demijeans.com','a nice demi jeans',2),
-- (2,'dessert boots',100,'medium','https://image.dessertboots.com','a nice shoe for outing',3),
-- (3,'Ralph Polo',19.99,'medium','https://image.polo.com','a nice polo shirt',1),
-- (4,'Long sleeves',10.99,'medium','https://image.sleeves.com','cool sleeves for outing',1);

-- INSERT INTO Roles (id,title)
-- VALUES
-- (1,'user'),
-- (2,'admin');

-- INSERT INTO Users (id,name,address,contact,email,password,role_id)
-- VALUES
-- (1,'Drew Osei','Lapaz,Accraa','0244563211','drewosei@example.com','willkommen',1),
-- (2,'Nana Kwesi','Madina,Accra','0554671023','nanakwesi@example.com','backendnode',2),
-- (3,'James Cudjoe','Legon,Accraa','056745235','james@example.com','brotherzone',1),
-- (4,'Anthony Martial','Circle,Accraa','0244565621','martial@example.com','password123',1);

-- INSERT INTO Admins (id,user_id,role_id,name)
-- VALUES (1,2,2,'Nana Kwesi');

-- INSERT INTO Orders (id,user_id,status,total,updated_by)
-- VALUES
-- (1,1,'approved',199.89,1),
-- (2,3,'rejected',56,1);

-- INSERT INTO OrderDetails (id,order_id,product_id,quantity)
-- VALUES 
-- (1,1,3,2),
-- (2,1,1,1),
-- (3,2,1,3);

-- Getting records

-- SELECT * FROM Products; 

-- SELECT * FROM Orders
-- WHERE id = 1;

-- SELECT Admins.id, Admins.name, Admins.user_id, Users.contact, Users.address
-- FROM (Admins
-- INNER JOIN Users ON Admins.user_id = Users.id);

-- Updating records

-- UPDATE Products
-- SET name = 'Vuitton Jeans', price = 55.99
-- WHERE id = 1;

-- UPDATE Users 
-- SET name = 'Fred Amugi', address = 'Tema,Accra'
-- WHERE id = 3;

-- INSERT INTO Products (id,name,price,size,image_url,description,category_id)
-- VALUES
-- (4,'demi jeans',30.99,'medium','https://image.demijeans.com','a nice demi jeans',2);

-- deleting records
-- DELETE FROM Products
-- WHERE id = 4;

-- DELETE from Users
-- WHERE id = 4;

